# DevOps Pipeline 
## Using Laravel Application (PHP | Apache | Mysql) 
### 1. Dockerfile: 
```To build php-apache Image```
### 2. docker-compose: 
```To split the application to microservices (php-apache | mysql | phpmyadmin)```
### 3. ansible-playbooks: 
```To automate the build of the Dockerfile & the docker-compose.yml```
### 4. Kubernetes: 
```Converting the docker-compose services to K8s deployment and services```
### 5. Jenkins: 
```To automate creating cluster and deploy the application using the K8s manifest files```
### 6. Terraform: 
```To automate the infrastruction of building Jenkins EC2```

## Step 1:
### 1. Build Jenkins EC2 Instance
```
$ cd terraform
$ terraform init
$ terraform plan
$ terraforl apply 
$ yes
```
### 2. Connect to the EC2 by SSH
```
# Make sure you are in the directory where the downloaded keypair located (in this example it is downloaded to the desktop)

$ ssh -i file.pem ec2-user@<Public IPv4 address>
```
### 3. Create sh file
```
$ vim install.sh
# Copy the lines in the sh script located in the terraform directory and save it 
$ chmod +x install.sh 
$ ./install.sh 
```
### 4. Make sure all has been installed successfully 
```
```
### 5. Add AWS Credentials to Jenkins  
```
$ aws configure set aws_access_key_id <AWS_ACCESS_KEY_ID>; aws configure set aws_secret_access_key <AWS_SECRET_ACCESS_KEY>; aws configure set default.region <REGION>
```
### 6. Create Kubernetes Cluster & NameSpace
```
$ eksctl create cluster --name <CLUSTER_NAME> --nodes-min=2

$ kubectl create namespace <NAMESPACE> # Make sure it is the same as the kubernetes deployment files
```
### 7. Browse to Jenkins
```
# Go to the browser the type 

<ec2-Public IPv4 address>:8080

# Proceed with setting up jenkins 
``` 
### 6. Create New Job 
```
Add Github repository URL 
Add Github Credentials
Add the Commands to run kubernetes deployment and services files

$ kubectl -n laravel-app apply -f k8s/db-deployment.yaml
$ kubectl -n laravel-app apply -f k8s/db-service.yaml
$ kubectl -n laravel-app apply -f k8s/php-apache-environment-deployment.yaml
$ kubectl -n laravel-app apply -f k8s/php-apache-environment-service.yaml
$ kubectl -n laravel-app apply -f k8s/db-phpmyadmin-deployment.yaml
$ kubectl -n laravel-app apply -f k8s/db-phpmyadmin-service.yaml
$ kubectl -n laravel-app apply -f k8s/php-apache-environment-claim0-persistentvolumeclaim.yaml
```
### 7. Composer Update 
```
Through ssh on Jenkins 

$ docker ps 

# connect to the php-apache container 

$ docker exec -it <CONTAINER_NAME> bash

# Make sure you are in the following path /var/www/html and the project files are there 

$ composer update
```
### 8. Access the application
```
<node-Public IPv4 address>:5000
<node-Public IPv4 address>:4000
```

