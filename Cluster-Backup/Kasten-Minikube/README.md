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

## Step 3: Deploy Kasten

Deploy Kasten on Minikube using the script **run-kasten-minikube.sh**

which will do the following:

1. Delete K10 if exist by running delete-kasten-minikube.sh
2. Start Minikube
3. Create namespace for kasten
4. Add Kasten helm repo
5. Sleep for 1 minute until the pods are started
6. Update the helm repo and upgrade Kasten
7. Forward port to port 8080
8. Open the broweser with the kasten URL

   [http://127.0.0.1:8080/k10/#/](http://127.0.0.1:8080/k10/#/)

## Delete Kasten Minikube

For deleting kasten on Minikube run the same script **run-kasten-minikube.sh** and follow the steps.

---

# Kasten Configuration

`NOTE: Kasten configurations can be imported using yaml files saved Or create it manually using the following steps:`

### Step 1: Create S3 Profile on K10

1. Navigate to **Settings** > **Location Profiles** in K10
2. Create New Profile
3. Give it a name
4. Choose **Amazon S3**
5. Use **AWS_Key_Id** & **Secret_Access_Key** for the user that was created on aws
6. Choose the **Region** and Type the **S3 Bucket Name** then hit **Save Profile**

### Step 7: Set K10 Backup / Restore Policy

### Step 8: Enable K10 Disaster Recovery
