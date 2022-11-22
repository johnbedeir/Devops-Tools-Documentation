# Build Kubernetes Cluster (EKS) using Terraform

### This project is to build Kubernetes Cluster (EKS) on AWS using Terraform.

**1. eks.tf** : AWS EKS resource and attache VPC

**2. igw.tf** : Internet Gateway

**3. nat.tf** : AWS Elastic IP and NAT gateway 

**4. nodes.tf** : EC2 (nodes) for the cluster

**5. provider.tf** : AWS Provider

**6. routes.tf** : Private and Public route tables

**7. subnets.tf** : Private and Public subnets on different zones

**8. vpc.tf** : Creating VPC


## Step 1:
```
terraform init
```
## Step 2: 
```
terraform plan
```
## Step 3:
```
terraform apply -auto-approve
```