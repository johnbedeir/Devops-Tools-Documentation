# #/bin/bash

#Create cluster
echo "--------------------Creating cluster--------------------"
eksctl create cluster --name cluster-1 --nodes-min=2

#Update kubeconfig
echo "--------------------Update kubeconfig--------------------"
aws eks update-kubeconfig --name cluster-1

#Create argocd namespace
echo "--------------------Creating argocd namespace--------------------"
kubectl create ns argocd || true

#Deploy ArgoCD on EKS
echo "--------------------Deploy ArgoCD on EKS--------------------"
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

#Sleep 1 miniute
echo "--------------------Wait for the pods to start--------------------"
sleep 1m

#Change to LoadBalancer
echo "--------------------Change Argocd Service to LoadBalancer--------------------"
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

#Reveal Argocd URL
echo "--------------------Argocd Ex-URL--------------------"
kubectl get service argocd-server -n argocd | awk '{print $4}'

#Reveal ArgoCD Pass
echo "--------------------ArgoCD UI Password--------------------"
echo "Username: admin"
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo ' '
