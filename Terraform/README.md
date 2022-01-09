# Create AWS EC2 using Terraform

## 1. Intsall [Terraform CLI](https://www.terraform.io/downloads)

## 2. Create main.tf file
```bash
# That containes the provider information and the ec2 instence specs
```

## 3. Initialize the directory
```bash
# Make sure you are in the directory that contains the tf files then do the follosing:
terraform init
```

## 4. Create security.tf file
```bash
# That containes the security group attached to the ec2 instence 
# Also the keypair that will be used to connect on the ec2 instence
```

## 5. Create variables.tf file
```bash
# That containes all the variables with the data that you should not expose to public
```

## 6. Check what will be created if you apply 
```bash
# This command is to check and show if there is an error before applying it 
terraform plan
```

## 7. Apply the infrastruction 
```bash
# This command is start building the infrastructure on the cloud  
terraform apply # It will first show your the plan then you have to type yes to build
```