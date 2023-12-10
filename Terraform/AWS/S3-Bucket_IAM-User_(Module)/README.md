# AWS S3 | IAM using Terraform Modules

## Build Infrastructure

This step will build S3 Bucket where all the backup will be stored and IAM Role that will be used by Kasten to Access your S3 Bucket.

Build the infrastructure by Terraform using the following commands

```
terraform init

terraform plan

terraform apply -auto-approve
```
