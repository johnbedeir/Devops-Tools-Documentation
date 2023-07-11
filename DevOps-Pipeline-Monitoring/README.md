# DevOps Pipeline

## Using Microservice Application (PHP | Apache | Mysql) | Monitoring using (Prometheus & Grafana)

### 1. Dockerfile:

`To build php-apache Image`

### 2. docker-compose:

`To split the application to microservices (php-apache | mysql | phpmyadmin)`

### 3. ansible-playbooks:

`To automate the build of the Dockerfile & the docker-compose.yml`

### 4. Kubernetes:

`Deploy Microservice application that contains PHP, Apache, MySql, and PhpMyAdmin`

### 5. Terraform:

`To automate the infrastruction of building Jenkins EC2`

### 6. Jenkinsfiles:

`To automate creating the cluster`
`To automate deploying the application`
`To automate deploying the monitoring`

## Step 1: Build Jenkins EC2 Instance

`Make sure you create tfvars file with the region, ami and public-ssh`

```
$ cd terraform
$ terraform init
$ terraforl apply -auto-approve
```

### Step 2: Connect to the EC2 using SSH

---

`You can use the downloaded keypair or just use the user and public-ip`

---

```
$ ssh -i file.pem ubuntu@<public-ip>
OR
$ ssh ubuntu@<public-ip>
```

### Step 3: Create sh file

---

`Use the same script in the current directory install.sh`

---

```
$ vim install.sh
$ chmod +x install.sh
$ ./install.sh
```

### Step 4: Make sure all has been installed successfully

```
java -version
jenkins --version
docker --version
ansible --version
docker-compose --version
eksctl version
minikube version
k9s version
aws --version
```

### Step 5: Browse to Jenkins

---

`Navigate to the browser and use the following to access jenkins then proceed with setting up jenkins`

---

```
<public-ip>:8080
```

---

### Step 6: Add Credentials for Dockerhub, Github and AWS

`For AWS you will need to download the folloowing Plugin:` [CloudBees AWS Credentials](https://plugins.jenkins.io/aws-credentials/)

Plugin:

```
Manage Jenkins > Manage Plugins > Available > CloudBees AWS Credentials
```

Add Credentials:

```
Manage Jenkins > Manage Credentials > global > Add Credentials
```

---

### Step 6: Create 1st Jenkins job

This job is to run the jenkinsfile in [Jenkins/Jenkins-EKS](https://github.com/johnbedeir/e-conomic/tree/dev/Jenkins/Jenkins-Deploy) which will create the cluster and the namespace

---

### Step 7: Create 2nd Jenkins job

This job is to run the jenkinsfile in [Jenkins/Jenkins-Deploy](https://github.com/johnbedeir/e-conomic/tree/dev/Jenkins/Jenkins-EKS) which will deploy monitoring and the microservice application

---

### Step 8: Create 3nd Jenkins job

This job is to run the jenkinsfile in [Jenkins/Jenkins-RM-EKS](https://github.com/johnbedeir/e-conomic/tree/dev/Jenkins/Jenkins-RM-EKS) which will delete the created cluster
