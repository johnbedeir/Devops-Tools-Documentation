# #/bin/bash

CLUSTER_NAME=cluster-1
NODES_NUMBER="2"
NAMESPACE=argocd
REGION=eu-central-1

#Create cluster
echo "--------------------Creating cluster--------------------"
eksctl create cluster --name ${CLUSTER_NAME} --nodes-min=${NODES_NUMBER}

#Update kubeconfig
echo "--------------------Update kubeconfig--------------------"
aws eks update-kubeconfig --name ${CLUSTER_NAME} --region ${REGION}

#Create argocd namespace
echo "--------------------Creating argocd namespace--------------------"
kubectl create ns ${NAMESPACE} || true

#Deploy ArgoCD on EKS
echo "--------------------Deploy ArgoCD on EKS--------------------"
kubectl apply -n ${NAMESPACE} -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

#Sleep 1 miniute
echo "--------------------Wait for the pods to start--------------------"
sleep 1m

#Change to LoadBalancer
echo "--------------------Change Argocd Service to LoadBalancer--------------------"
kubectl patch svc argocd-server -n ${NAMESPACE} -p '{"spec": {"type": "LoadBalancer"}}'

#Sleep 10 seconds
echo "--------------------Creating External-IP--------------------"
sleep 10s

#Reveal Argocd URL
echo "--------------------Argocd Ex-URL--------------------"
kubectl get service argocd-server -n ${NAMESPACE} | awk '{print $4}'

#Reveal ArgoCD Pass
echo "--------------------ArgoCD UI Password--------------------"
echo "Username: admin"
kubectl -n ${NAMESPACE} get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d > argo-pass.txt
