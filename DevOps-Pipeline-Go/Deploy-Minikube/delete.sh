#!/bin/bash

namespace="go-survey"
image_name="triple3a/gosurvey"

# remove preious docker images
echo "--------------------Remove Previous build--------------------"
docker rmi -f $(docker images -q $image_name)

# remove deployment
echo "--------------------Remove App Deployment--------------------"
kubectl delete -n $namespace -f k8s/

# remove namespace
echo "--------------------Remove Namespace--------------------"
kubectl delete ns $namespace
