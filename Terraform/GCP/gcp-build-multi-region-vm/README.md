# Terraform Multi-Region VM Deployment on GCP

<img src=cover.png>

This Terraform project automates the deployment of VM instances across multiple Google Cloud Platform (GCP) regions. It allows for dynamic configuration of the deployment regions, network tags, and machine types via a `terraform.tfvars` file. Additionally, it supports the use of a custom boot disk image.

## Prerequisites

- Google Cloud Platform (GCP) account.
- A configured GCP project with the Compute Engine API enabled.
- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- Google Cloud SDK (gcloud) [installed and configured](https://cloud.google.com/sdk/docs/install) for access to your GCP account.

## Configuration

1. **GCP Authentication**: Ensure your Google Cloud SDK is authenticated against your GCP account and has permission to access and create resources. Use the following command to authenticate:

   ```bash
   gcloud auth application-default login
   ```

2. **GCP Credentials Key**: Run the following command to download the credentials json file:

   ```
   gcloud iam service-accounts keys create FILE_NAME.json --iam-account SERVICE_ACCOUNT_EMAIL
   ```

3. **Terraform Variables**: Configure your deployment settings in the `terraform.tfvars` file. Example configuration:

   ```hcl
   regions = ["europe-west3", "europe-west2"] #Frankfurt, London

   network_tags = ["pre-prod", "prod"]

   machine_type = "e2-medium"

   #boot_disk_image = "projects/PROJECT_ID/global/images/YOUR_CUSTOM_IMAGE"
   boot_disk_image = "ubuntu-os-cloud/ubuntu-2004-lts"
   ```

   Replace `PROJECT_ID` with your actual GCP project ID in the custom image path if you wish to use a custom image.

4. **Custom Boot Disk Image**: To use a custom boot disk image, comment out the line with the Ubuntu image and uncomment the line with the custom image. Ensure you replace `PROJECT_ID` with your actual GCP project ID.

## Deployment

1. **Initialize Terraform**:

   Run the following command in your terminal in the directory containing your Terraform configuration files to initialize Terraform:

   ```bash
   terraform init
   ```

2. **Plan the Deployment**:

   Review the changes Terraform plans to make with the following command:

   ```bash
   terraform plan
   ```

   **This will show you that it will be building 2 VMs on 2 different regions, the same with other resources:**

   <img src=1.png>
   <img src=2.png>

3. **Apply the Configuration**:

   Apply the Terraform configuration to start the deployment:

   ```bash
   terraform apply
   ```

## Cleanup

To remove the deployed resources and avoid ongoing charges, run:

```bash
terraform destroy
```
