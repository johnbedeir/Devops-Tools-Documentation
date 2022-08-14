# Python App Kubernetes Deployment

## Step 1: Deployment

This file is using the image we have built using our _Dockerfile_ and we push it to our _Dockerhub repository_ using _playbook.yaml_ file to deploy our application

## Step 2: Service

We are using _Loadbalancer_ since we are running our application on cloud, remember to change it to _NodePort_ if you would like to deploy locally
