### `For Prerequisites check` [here](https://github.com/johnbedeir/Devops-Tools-Documentation/blob/main/Cluster-Backup/Kasten-Minikube/prerequisites.sh)

---

# Backup EKS Cluster using Kasten (K10)

## Step 1: Build Infrastructure

This step will build S3 Bucket where all the backup will be stored and IAM Role that will be used by Kasten to Access your S3 Bucket.

Build the infrastructure by Terraform using the following commands

```
cd Terraform

terraform init

terraform plan

terraform apply -auto-approve
```

## Step 2: Create Cluster and Deploy Application

```
ansible-playbook aws-eks-app-deploy.yaml
```

## To delete cluster and application deployment

```
ansible-playbook aws-eks-app-remove.yaml
```

## Step 3: Deploy Kasten AWS

Deploy Kasten using the automated script **kasten-deployment.sh**

```
cd Terrafrom

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
cd Terraform

chmod +x delete-kasten-deployment.sh

./delete-kasten-deployment.sh
```
