# #/bin/bash

#Delete ArgoCD EKS
echo "--------------------Delete ArgoCD EKS--------------------"
kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

#Delete argocd namespace
echo "--------------------Deleting argocd namespace--------------------"
kubectl delete ns argocd

#Delete cluster
echo "--------------------Deleting cluster--------------------"
eksctl delete cluster --name cluster-1

#Sleep 30 seconds
echo "--------------------Wait for completely delete EKS--------------------"
sleep 30s
