# #/bin/bash

CLUSTER_NAME=cluster-1
NAMESPACE=argocd
REGION=eu-central-1

#Delete ArgoCD EKS
echo "--------------------Delete ArgoCD EKS--------------------"
kubectl delete -n ${NAMESPACE} -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

#Delete argocd namespace
echo "--------------------Deleting argocd namespace--------------------"
kubectl delete ns ${NAMESPACE}

#Delete cluster
echo "--------------------Deleting cluster--------------------"
eksctl delete cluster --name ${CLUSTER_NAME} --region ${REGION}

#Delete ArgoCD Password
echo "--------------------Delete ArgoCD Password--------------------"
rm -rf argo-pass.txt

#Sleep 30 seconds
echo "--------------------Wait for completely delete EKS--------------------"
sleep 30s
