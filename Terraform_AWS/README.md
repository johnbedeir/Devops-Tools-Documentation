# Create Ubuntu EC2 on AWS using Terraform
[Watch Terraform_Part1 شرح on YouTube](https://youtu.be/zF_N4flz8lw)

[Watch Terraform_Part2 شرح on YouTube](https://youtu.be/V6CPs_C9v8A)


## 1. Intsall [Terraform CLI](https://www.terraform.io/downloads)

## 2. Create providers.tf file
```bash
# Which containes the provider information
```
## 3. Initialize the directory
```bash
# Make sure you are in the directory that contains the tf files then do the follosing:
terraform init
```

## 4. Create main.tf file
```bash
# That containes the resources that you will build ex: EC2 instence specs
```

## 4. Create security.tf file
```bash
# That containes the security group attached to the ec2 instence 
# Also the keypair that will be used to connect on the ec2 instence
```

## 5. Create variables.tf file
```bash
# That containes all the variables with the data that you should not expose to public

# Make sure you generate SSH key if you don't have one and added into the variables.tf file
ssh-keygen 
```

## 6. Create terraform.tfvars file 
```bash
# That contains the variables that you will not share it on the version control
# Add your public ssh key to the terraform.tfvars
# Remember to add it to .gitignore file
```

## 7. Check what will be created if you apply 
```bash
# This command is to check and show if there is an error before applying it 
terraform plan
```

## 8. Apply the infrastruction 
```bash
# This command is start building the infrastructure on the cloud  
terraform apply # It will first show your the plan then you have to type yes to build
# OR 
terraform apply -auto-approve # To plan and apply changes without confirming
```

## 9. Connect to the created EC2 instence
```bash
# Make sure you are in the directory where the keypair was downloaded   
ssh -i "file.pem" <user@ec2...>
```

## 10. Destroy created resources
```bash
# This command will show you first what it will destroy then ask you to type yes to confirm
terraform destroy
# OR
terraform destroy -auto-approve # To immediately destroy all the created resources without confirming 
```