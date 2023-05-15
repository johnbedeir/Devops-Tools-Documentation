#!/bin/bash

# Variables

namespace="go-survey"
image_name="triple3a/gosurvey"

# Set the file name and search string
deployfile="k8s/deployment.yml"
composefile="docker-compose.yml"

# Get the tag from Docker Hub
tag=$(curl -s https://hub.docker.com/v2/repositories/triple3a/gosurvey/tags\?page_size\=1000 | jq -r '.results[].name' | awk 'NR==1 {print$1}')

# Extract the numeric part of the tag (assuming it is at the end)
numeric_part=$(echo "$tag" | sed 's/.*\([0-9]\+\)$/\1/')

# Increment the numeric part
next_numeric=$((numeric_part + 1))

# Replace the numeric part in the tag
newtag=$(echo "$tag" | sed "s/$numeric_part$/$next_numeric/")

# End Variables

# remove preious docker images
echo "--------------------Remove Previous build--------------------"
docker rmi -f $(docker images -q $image_name)

# build new docker image with new tag
echo "--------------------Build new Image--------------------"
docker build -t $image_name:$newtag .

# push the latest build to dockerhub
echo "--------------------Pushing Docker Image--------------------"
docker push $image_name:$newtag

# replace the tag in the kubernetes deployment file
echo "--------------------Update Img Tag Deployment--------------------"
awk -v search="$tag" -v replace="$newtag" '{gsub(search, replace)}1' "$deployfile" > tmpfile && mv tmpfile "$deployfile"

# replace the tag in the docker compose file
echo "--------------------Update Img Tag Docker Compose--------------------"
awk -v search="$tag" -v replace="$newtag" '{gsub(search, replace)}1' "$composefile" > tmpfile && mv tmpfile "$composefile"

# create namespace
echo "--------------------creating Namespace--------------------"
kubectl create ns $namespace || true

# deploy app
echo "--------------------Deploy App--------------------"
kubectl apply -n $namespace -f k8s
