# Terraform VM on GCP

## Step 1: Install GCP CLI
```
https://cloud.google.com/sdk/docs/install
```

## Step 2: Create Project on your GCP
``Make sure to Enable Compute Engine Service by going to your GCP account >> Left panel >> Compute Engine >> Enable``
```
https://developers.google.com/workspace/guides/create-project
```

## Step 3: Create IAM User on your GCP

``Set the user role to Owner``
```
https://www.techrepublic.com/article/how-to-create-iam-credentials-on-google-cloud-platform/
```
## Step 4: Create Serivce Account on your GCP

``Grant users access to this service account with your User Account Email``
```
https://support.site24x7.com/portal/en/kb/articles/how-to-create-a-service-account-in-gcp-console
```
## Step 5: Create Key for your Service Account on your GCP

``Download the JSON file that you will use later in your provider.tf``
```
https://cloud.google.com/iam/docs/creating-managing-service-account-keys
```
---
### a) Ubuntu VM SSH:
``
Make sure the json file is located in the terraform directory next to provider.tf
``
```
https://cloud.google.com/compute/docs/instances/connecting-to-instance

```
### b) Windows VM RDP:
``
After creating the Windows VM: Navigate to "GCP Console >> Compute Engine >> Your_VM"  "RDP" and Download RDP File, Also "Set Windows Password" to use it and connect to your VM
``
#### If you are using Linux you can use Remmina App to connect to your Windows VM using the RDP file
[Download Remmina For Linux](https://remmina.org/how-to-install-remmina/)
