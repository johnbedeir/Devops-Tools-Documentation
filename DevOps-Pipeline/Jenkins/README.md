# Create Jenkins Pipeline Using Jenkinsfile

## Step 1: Building the infrastructure

`make sure you add your public ssh key into terraform.tfvars file before you proceed`

```
cd terraform
terraform init
terraform apply -auto-approve
```

## Step 2: Connecting to the EC2

`ssh to the created EC2 using the following command`

```
# Replace <public-ip-address> with the EC2 IP

ssh -i mykey.pem ubuntu@<public-ip-address>
```

## Step 3: Installation

```
vim install.sh

# Copy the text in the file located with the project called install.sh into the file you just created

chmod +x install.sh
./install.sh
```

## Step 4: Access Jenkins

```
# Replace <public-ip-address> with the EC2 IP
<public-ip-address>:8080
```

## Step 5: Configure Jenkins

### Add Credentials

`Manage Jenkins > Manage Credentials > global > Add Credentials`

Add Github Username & Password

Add Dockerhub Username & Access Token

## Step 6: Create and Run Pipeline

`Dashboard > New Item > Ppeline`

From Definition choose "Pipeline Script from SCM" > Choose "Git" as SCM > Add repository URL > Choose Credentials from the dropdown menu

`make sure the branch name is right and the path where Jenkinsfile is located in the repository`

Save > Build Now
