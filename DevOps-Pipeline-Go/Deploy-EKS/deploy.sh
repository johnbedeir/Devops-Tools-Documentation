#!/bin/bash

# Variables

namespace="go-survey"
image_name="triple3a/gosurvey"

# Set the file name and search string
filename="k8s/app-deployment.yml"

# Get the tag from Docker Hub
tag=$(curl -s https://hub.docker.com/v2/repositories/triple3a/gosurvey/tags\?page_size\=1000 | jq -r '.results[].name' | awk 'NR==1 {print$1}')

# Extract the numeric part of the tag (assuming it is at the end)
numeric_part=$(echo "$tag" | sed 's/.*\([0-9]\+\)$/\1/')

# Increment the numeric part
next_numeric=$((numeric_part + 1))

# Replace the numeric part in the tag
newtag=$(echo "$tag" | sed "s/$numeric_part$/$next_numeric/")

# End Variables

# Create the cluster
echo "--------------------Creating EKS--------------------"
eksctl create cluster --name cluster1 --region eu-central-1 --nodes-min=2

# Create IAM Policy
# https://github.com/kubernetes-sigs/aws-ebs-csi-driver/blob/master/docs/example-iam-policy.json
echo "--------------------Creating IAM Policy--------------------"
aws iam create-policy --policy-name AmazonEKS_EBS_CSI_Driver_Policy --policy-document file://$(pwd)/policy.json

eksctl create iamserviceaccount \
    --region <your-region> \
    --name ebs-csi-controller-sa \
    --namespace kube-system \
    --cluster <your-cluster-name> \
    --attach-policy-arn arn:aws:iam::<AWS_ACCOUNT_ID>:policy/AmazonEKS_EBS_CSI_Driver_Policy \
    --approve \
    --override-existing-serviceaccounts


# Create EBS CSI
echo "--------------------Creating EBS CSI--------------------"
helm repo add aws-ebs-csi-driver https://kubernetes-sigs.github.io/aws-ebs-csi-driver/
helm repo update
helm install aws-ebs-csi-driver aws-ebs-csi-driver/aws-ebs-csi-driver --namespace kube-system --set enableVolumeScheduling=true --set enableVolumeResizing=true --set enableVolumeSnapshot=true

# remove preious docker images
echo "--------------------Remove Previous build--------------------"
docker rmi -f $(docker images -q $image_name)

# build new docker image with new tag
echo "--------------------Build new Image--------------------"
docker build -t $image_name:$newtag ./Go-app/

# push the latest build to dockerhub
echo "--------------------Pushing Docker Image--------------------"
docker push $image_name:$newtag

# Replace the tag in the kubernetes deployment file
echo "--------------------Update Img Tag--------------------"
awk -v search="$tag" -v replace="$newtag" '{gsub(search, replace)}1' "$filename" > tmpfile && mv tmpfile "$filename"

# Update kubeconfig
echo "--------------------Update Kubeconfig--------------------"
aws eks update-kubeconfig --name cluster1 --region eu-central-1

# create namespace
echo "--------------------creating Namespace--------------------"
kubectl create ns $namespace || true

# deploy app
echo "--------------------Deploy App--------------------"
kubectl apply -f k8s
