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
next_numeric=$((numeric_part - 1))

# Replace the numeric part in the tag
previoustag=$(echo "$tag" | sed "s/$numeric_part$/$next_numeric/")

# End Variables


# replace the tag in the kubernetes deployment file
echo "--------------------Update Img Tag Deployment--------------------"
awk -v search="$tag" -v replace="$previoustag" '{gsub(search, replace)}1' "$deployfile" > tmpfile && mv tmpfile "$deployfile"

# replace the tag in the docker compose file
echo "--------------------Update Img Tag Docker Compose--------------------"
awk -v search="$tag" -v replace="$previoustag" '{gsub(search, replace)}1' "$composefile" > tmpfile && mv tmpfile "$composefile"

# deploy app
echo "--------------------Deploy App--------------------"
kubectl apply -f k8s
