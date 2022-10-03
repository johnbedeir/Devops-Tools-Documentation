### `For Prerequisites check` [here](<https://aws.amazon.com/blogs/containers/backup-and-restore-your-amazon-eks-cluster-resources-using-velero/#:~:text=using%20a%20(PVC).-,Prerequisites,-To%20be%20able>)

---

# Method 1: Deploy K10 on AWS

## Step 1: Build Infrastructure

This step will build S3 Bucket where all the backup will be stored and IAM Role that will be used by Kasten to Access your S3 Bucket.

Build the infrastructure by Terraform using the following commands

```
terraform init

terraform plan

terraform apply -auto-approve
```

## Step 2: Deploy Kasten AWS

Deploy Kasten using the automated script **kasten-deployment.sh**

```
chmod +x kasten-deployment.sh

./kasten-deployment.sh
```

which will do the following:

1. Run pre-check before deployment
2. Update kubeconfig
3. Show the available OIDC then associate it with the cluster
4. Add helm repo for Kasten
5. Create namespace for Kasten
6. Install Kasten using helm
7. Sleep for 1 minute until the pods are started
8. Update the helm repo and upgrade Kasten
9. Set external gateway to access Kasten via LoadBalancer
10. Reveal Kasten URL
11. Reveal Kubernetes token to access Kasten

## Delete Kasten Deployment

For deleting kasten deployment use the script **delete-kasten-deployment.sh**

```
chmod +x delete-kasten-deployment.sh

./delete-kasten-deployment.sh
```

# Method 2: Deploy Kasten on Minikube

## Step 1: Deploy Kasten

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

For deleting kasten on Minikube use the script **delete-kasten-minikube.sh**

---

# Kasten Configuration

`NOTE: Kasten configurations can be imported using yaml files saved` [Kasten-Yaml-Backup](https://github.com/johnbedeir/Kasten-K10/tree/main/Kasten-Yaml-Backup) ` Or create it manually using the following steps:`

### Step 1: Create S3 Profile on K10

1. Navigate to **Settings** > **Location Profiles** in K10
2. Create New Profile
3. Give it a name
4. Choose **Amazon S3**
5. Use **AWS_Key_Id** & **Secret_Access_Key** for the user that was created on aws
6. Choose the **Region** and Type the **S3 Bucket Name** then hit **Save Profile**

### Step 7: Set K10 Backup / Restore Policy

### Step 8: Enable K10 Disaster Recovery
