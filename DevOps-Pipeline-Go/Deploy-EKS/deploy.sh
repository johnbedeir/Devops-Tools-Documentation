#!/bin/bash

# Variables
cluster_name="cluster-1-test"
namespace="go-survey"
REGION="eu-central-1"
image_name="702551696126.dkr.ecr.eu-central-1.amazonaws.com/goapp-survey/app-img:latest"

# End Variables

# create the cluster
echo "--------------------Creating EKS--------------------"
echo "--------------------Creating ECR--------------------"
echo "--------------------Creating EBS--------------------"
echo "--------------------Deploying Ingress--------------------"
echo "--------------------Deploying Argo--------------------"
cd terraform && \ 
terraform init 
terraform apply -auto-approve

# update kubeconfig
echo "--------------------Update Kubeconfig--------------------"
aws eks update-kubeconfig --name $cluster_name --region $region

# remove preious docker images
echo "--------------------Remove Previous build--------------------"
docker rmi -f $(docker images -q $image_name)

# build new docker image with new tag
echo "--------------------Build new Image--------------------"
docker build -t $image_name ./Go-app/

#ECR Login
echo "--------------------Login to ECR--------------------"
aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 702551696126.dkr.ecr.eu-central-1.amazonaws.com

# push the latest build to dockerhub
echo "--------------------Pushing Docker Image--------------------"
docker push $image_name

# create namespace
echo "--------------------creating Namespace--------------------"
kubectl create ns $namespace || true

# deploy app
echo "--------------------Deploy App--------------------"
kubectl apply -f k8s
