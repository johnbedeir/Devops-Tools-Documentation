#!/bin/bash

namespace="go-survey"
region="eu-central-1"
cluster_name="cluster-1"
repo_name="goapp-survey"

# delete Docker-img from ECR
echo "--------------------Deleting ECR-IMG--------------------"
aws ecr batch-delete-image --repository-name $repo_name --image-ids imageTag=latest

# delete deployment
echo "--------------------Deleting Deployment--------------------"
kubectl delete -n $namespace -f k8s/

# delete namespace
echo "--------------------Deleting Namespace--------------------"
kubectl delete ns $namespace

# delete AWS resources
echo "--------------------Deleting AWS Resources--------------------"
cd terraform && \
terraform destroy -auto-approve
