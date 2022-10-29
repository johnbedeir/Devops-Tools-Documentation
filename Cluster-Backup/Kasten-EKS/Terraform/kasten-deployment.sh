#!/bin/bash

NAMESPACE=kasten-io
EKS_CLUSTER_NAME=simple-project-cluster
KASTEN_AWS_ACCESS_KEY=$(terraform output access_key_id)
KASTEN_AWS_SECRET_KEY=$(terraform output secret_access_key)
KASTEN_IAM_ARN=$(terraform output user_arn)
sa_secret=$(kubectl get serviceaccount k10-k10 -o jsonpath="{.secrets[0].name}" --namespace kasten-io)

echo "--------------------Deploy the the pre-check tool--------------------"
curl https://docs.kasten.io/tools/k10_primer.sh | bash

echo "--------------------Update kubeconfig with cluster name--------------------"
aws eks update-kubeconfig --name ${EKS_CLUSTER_NAME}

echo "--------------------Create IAM OIDC & associate with cluster--------------------"
eksctl utils associate-iam-oidc-provider --cluster ${EKS_CLUSTER_NAME} --approve

echo "--------------------Add Kasten Helm Repo--------------------"
helm repo add kasten https://charts.kasten.io/ || true

echo "--------------------Create Kasten namespace--------------------"
kubectl create namespace $NAMESPACE || true 

echo "--------------------Install Kasten--------------------"
helm install k10 kasten/k10 --namespace=$NAMESPACE \
    --set secrets.awsAccessKeyId="${KASTEN_AWS_ACCESS_KEY}" \
    --set secrets.awsSecretAccessKey="${KASTEN_AWS_SECRET_KEY}" \
    --set secrets.awsIamRole="${KASTEN_IAM_ARN}" 

echo "--------------------Wait Pod is Starting--------------------"
sleep 1m

echo "--------------------Update Helm Repo & Upgrade K10--------------------"
helm repo update && \
    helm get values k10 --output yaml --namespace=kasten-io > k10_val.yaml && \
    helm upgrade k10 kasten/k10 --namespace=kasten-io -f k10_val.yaml \
    --set secrets.awsAccessKeyId="${KASTEN_AWS_ACCESS_KEY}" \
    --set secrets.awsSecretAccessKey="${KASTEN_AWS_SECRET_KEY}"

#This will set external gateway so we can access K10 via loadbalancer 
echo "--------------------Access K10 via LoadBalancer--------------------"
helm upgrade k10 kasten/k10 --namespace=kasten-io \
    --reuse-values \
    --set externalGateway.create=true \
    --set auth.tokenAuth.enabled=true \
    --set secrets.awsAccessKeyId="${KASTEN_AWS_ACCESS_KEY}" \
    --set secrets.awsSecretAccessKey="${KASTEN_AWS_SECRET_KEY}" 

#This step to reveal the loadbalancer URL which will be used to access K10 via browser 
echo "--------------------Reveal K10 URL--------------------"
echo "Use the following URL to access Kasten from your browser: MAKE SURE YOU ADD /k10/# in the end of the URL"
kubectl get service gateway-ext -n kasten-io | awk '{print $4}'

echo "--------------------Remove Old Token--------------------"
rm -rf token.txt

#This is going to reveal K82 Token that will be used once we access K10 on browser 
echo "--------------------Find the K8s Token in token.txt--------------------"
kubectl get secret $sa_secret --namespace kasten-io -ojsonpath="{.data.token}{'\n'}" | base64 --decode > token.txt