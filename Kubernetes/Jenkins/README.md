# Create EKS Cluster using Jenkinsfile

## Step 1: Infrastructure

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

`For AWS Credentials you need to download from Jenkins plugins "CloudBees AWS Credentials"`

`Manage Jenkins > Manage Credentials > global > Add Credentials > Kind: Aws Credentials`

Add AWS Access ID & Secret Access Key

## Step 6: Create Jenkins Pipeline

New Item > Choose Pipeline > Pipeline > Definition: Pipeline script from SCM > SCM: Git

`After you run the pipeline and your application is deployed`

## Step 7: Find External IP in K9s

1. SSH on the Jenkins EC2
2. Run the following command to connect the Jenkins EC2 with your AWS

```
aws configure
```

3. Then run the following command to update the kubeconfig

```
aws eks update-kubeconfig --name <cluster name>
```

4. Open K9s

```
k9s
```

5. Press Ctrl+A ---> Search for Service and open ---> you will find your External Ip that you will use to access your application
