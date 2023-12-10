# #/bin/bash

CLUSTER_NAME=cluster-1
REGION=eu-central-1
RELEASE_NAME=my-argo-cd

#Delete ArgoCD EKS
echo "--------------------Delete ArgoCD EKS--------------------"
helm uninstall ${RELEASE_NAME}

#Delete cluster
echo "--------------------Deleting cluster--------------------"
eksctl delete cluster --name ${CLUSTER_NAME} --region ${REGION}

#Delete ArgoCD Password
echo "--------------------Delete ArgoCD Password--------------------"
rm -rf argo-pass.txt

#Sleep 30 seconds
echo "--------------------Wait for completely delete EKS--------------------"
sleep 30s