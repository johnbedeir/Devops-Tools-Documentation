#!/bin/bash

# delete app
echo "--------------------Deleting App--------------------"
kubectl delete -f k8s/

# delete namespace
echo "--------------------Deleting Namespace--------------------"
kubectl delete ns go-survey

# delete cluster
echo "--------------------Deleting EKS--------------------"
eksctl delete cluster --name cluster1 --region eu-central-1
