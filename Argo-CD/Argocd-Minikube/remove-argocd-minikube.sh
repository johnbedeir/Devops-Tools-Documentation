#/bin/bash

#Delete ArgoCD
echo "--------------------Delete ArgoCD Deployment--------------------"
kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

#Delete ArgoCD Namespace
echo "--------------------Delete ArgoCD Namespace--------------------"
kubectl delete ns argocd

#Delete ArgoCD helm repo
echo "--------------------Delete ArgoCD Helm Repo--------------------"
helm repo rm argo
