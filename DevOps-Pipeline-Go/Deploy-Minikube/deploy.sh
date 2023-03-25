#!/bin/bash

# Set the file name and search string
filename="k8s/deployment.yml"
searchstring="triple3a/gosurvey:latest"

# Get the tag from Docker Hub
tag=$(curl -s https://hub.docker.com/v2/repositories/triple3a/gosurvey/tags\?page_size\=1000 | jq -r '.results[].name' | awk 'NR==1 {print$1}')

# Replace the tag in the YAML file
awk -v search="$searchstring" -v replace="triple3a/gosurvey:$tag" '{gsub(search, replace)}1' "$filename" > tmpfile && mv tmpfile "$filename"

# build,push and deploy the app

ansible-playbook deploy.playbook.yml
