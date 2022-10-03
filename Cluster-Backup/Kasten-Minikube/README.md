# Cluster Backup on Minikube using Kasten

## Step 1: Install _prerequisites.sh_

This script includes the needed tools for this project to run:

1. Docker
2. Kubectl
3. Minikube
4. K9s
5. Helm

```
chmod +x prerequisites.sh

./prerequisites.sh
```

## Step 2: Build the infrastructure for Kasten

Find the infrastructure for Kasten in the following [URL](https://github.com/johnbedeir/Devops-Tools-Documentation/tree/main/Cluster-Backup/Terraform_S3-Bucket_IAM-User) and follow the steps in the readme file.

## Step 3: Deploy Kasten on Minikube

```
chmod +x run-kasten-minikube.sh

./run-kasten-minikube.sh
```

## Step 4: Deploy Simple Application

Find the application [Here](https://github.com/johnbedeir/Devops-Tools-Documentation/tree/main/Cluster-Backup/Kasten-Minikube/simple-project)

```
cd simple-project/k8s

ansible-playbook app-deploy-playbook.yaml
```

## Step 5: Set Kasten Location

Set your S3 bucket as the location for Kasten where you will backup your data

Navigate to **Settings** > **Location** > **New Location**

Use the IAM User Access Key and Secret Access Key from the output of Terraform

## Step 6: Create Backup Policy

Navigate to **Policy** > **Create Policy** > **Choose Namespace** > **Run Backup**
