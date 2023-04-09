# Create Ubuntu Droplet on DigitalOcean

This `Terraform` project is to build `Ubuntu` Droplet on DigitalOcean

### Step 1: After Signing up create `New-Project`

### Step 2: Add your `SSH Key`
1. Navigate to `Settings` on the left panel
2. Choose `Security` and add your `Public SSH Key`

### Step 3: Create `Token`
1. Navigate to `API` on the left panel
2. `Generate New Token` make sure you mark the `Write` option
3. Create a new file in the project `terraform.tfvars` and add the `Token` as a variable

`Replace <YOUR-TOKEN> with the token you have generated`
```
token="<YOUR-TOKEN>"
```

### Step 4: Build `Ubuntu` Droplet
```
terraform init
```
```
terraform plan
```
```
terraform apply -auto-approve
```
