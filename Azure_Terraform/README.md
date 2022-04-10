# Terraform VM on MS Azure

## Step 1: Install Azure CLI
```
https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt
```
## Step 2: Connect to Azure

``This command will open new tab in your browser and ask you to login with your Azure account then will connect automatically``

```
az login
```
## Step 3: Run the following commands
```
terraform init
terraform plan
terraform apply -auto-approve
```
## Step 4: Connect to the VM
---
### a) Ubuntu VM SSH:
``
Make sure you add your public ssh key in "terraform.tfvars" and then you will be able to connect automatically without keypair file like AWS
``
```
ssh azureuser@public_ip_address
```
### b) Windows VM RDP:
``
After creating the Windows VM: Navigate to "Azure portal >> Virtual Machines >> myVM"  on the left upper corner "Connect >> RDP" and Download RDP File
``
#### If you are using Linux you can use Remmina App to connect to your Windows VM using the RDP file
[Download Remmina For Linux](https://remmina.org/how-to-install-remmina/)
