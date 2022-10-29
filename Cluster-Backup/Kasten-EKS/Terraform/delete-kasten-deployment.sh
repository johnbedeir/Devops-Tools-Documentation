#!/bin/bash
NAMESPACE=kasten-io
EKS_CLUSTER_NAME=simple-project-cluster
oidc_id=$(aws eks describe-cluster --name ${EKS_CLUSTER_NAME} --query "cluster.identity.oidc.issuer" --output text | cut -d '/' -f 5)
oidc_arn=$(aws iam list-open-id-connect-providers | grep $oidc_id | awk '{print $2}' | tr -d '"')

#Delete OIDC
echo "--------------------Delete Associated OIDC--------------------"
aws iam delete-open-id-connect-provider --open-id-connect-provider-arn $oidc_arn

#Remove kasten helm repo 
echo "--------------------Remove K10 Helm Repo--------------------"
helm repo remove kasten 

#Delete Kasten using Helm 
echo "--------------------Delete K10 Helm Deployment--------------------"
helm uninstall k10 --namespace=kasten-io

#Delete deployments
echo "--------------------Delete Deployment--------------------"
kubectl delete deploy --all -n $NAMESPACE || true

#Delete services
echo "--------------------Delete Services--------------------"
kubectl delete service --all -n $NAMESPACE || true

#Delete configmap
echo "--------------------Delete Configmap--------------------"
kubectl delete configmap --all -n $NAMESPACE || true

#Delete namespace
echo "--------------------Delete Namespace--------------------"
timeout 5s kubectl delete namespace $NAMESPACE || true

#Get namespace json file 
echo "--------------------Get NS Json--------------------"
kubectl get namespace $NAMESPACE -o json > ns.json

#Remove kubernetes from namespace metadata to be able to delete namespace
echo "--------------------Edit NS Json--------------------"
sed -i '/"kubernetes"/d' ./ns.json

# #replace the new json with the old one 
echo "--------------------Replace NS Json--------------------"
kubectl replace --raw "/api/v1/namespaces/$NAMESPACE/finalize" -f ./ns.json

#Wait to completely remove K10
echo "--------------------Wait to completely remove k10--------------------"
sleep 30s