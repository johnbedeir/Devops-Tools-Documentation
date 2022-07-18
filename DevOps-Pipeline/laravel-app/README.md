# DevOps Pipeline

## Using Laravel Application (PHP | Apache | Mysql)

### 1. Dockerfile:

`To build php-apache Image`

### 2. docker-compose:

`To split the application to microservices (php-apache | mysql | phpmyadmin)`

### 3. ansible-playbooks:

`To automate the build of the Dockerfile & the docker-compose.yml`

### 4. Terraform:

`To automate the infrastruction of building Jenkins EC2`

### 5. Jenkins:

`To automate deploying the application`

## Step 1: Build Jenkins EC2 Instance

```
$ cd terraform
$ terraform init
$ terraform plan
$ terraforl apply -auto-approve
```

### Step 2: Connect to the EC2 by SSH

---

`Make sure you are in the directory where the downloaded keypair located (in this example it is downloaded to the desktop)`

---

```
$ ssh -i file.pem ec2-user@<Public IPv4 DNS>
```

### Step 3: Create sh file

---

`Copy the lines in the sh script located in the terraform directory and save it`

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

`Go to the browser the type the following then proceed with setting up jenkins`

---

```
<ec2-Public IPv4 DNS>:8080
```

### Step 6: Create 1st Jenkins job

---

`This job is to run the docker compose on the EC2, add the github repository url and github credentials then type the following in execute shell`

---

```
ansible-playbook playbook-dcompose.yml
```

---

## Step 7 is not needed anymore since we added composer update command in the playbook

### Step 7: Access your application

---

`You will need to update the composer inside the running php-apache container first, get the container name by using ($ docker ps) and make sure you are in /var/www/html/`

---

```
docker exec -it <PHP_APACHE_CONTAINER_NAME>
composer update
```

### Step 8: Access your application

```
<ec2-Public IPv4 DNS>:5000
<ec2-Public IPv4 DNS>:4000
```

# Task:

`Already added the steps needed to solve this task, proceed with the next steps`

---

### Step 9: Create Kubernetes files

---

`Make sure you are in the root directory of the application on your machine, this will be done locally then commit the edits to github`

`This command is to convert your docker-compose file to kubernetes files`

---

```
kompose convert
```

### Step 10: Create 2nd Jekins job

---

`This job is to add AWS credentials, create cluster and create namespace`

---

```
aws configure set aws_access_key_id <AWS_ACCESS_KEY_ID>; aws configure set aws_secret_access_key <AWS_SECRET_ACCESS_KEY>; aws configure set default.region <REGION>

eksctl create cluster --region=<REGION> --name=<CLUSTER_NAME> --nodes-min=2

kubectl create namespace <NAMESPACE>
```

### Step 11: Create 3rd Jenkins job

---

`This job is to automate the deployment that will run the k8s deployment and services yml files`

---

```
kubectl -n laravel-app apply -f k8s/db-deployment.yaml
kubectl -n laravel-app apply -f k8s/db-service.yaml
kubectl -n laravel-app apply -f k8s/php-apache-environment-deployment.yaml
kubectl -n laravel-app apply -f k8s/php-apache-environment-service.yaml
kubectl -n laravel-app apply -f k8s/db-phpmyadmin-deployment.yaml
kubectl -n laravel-app apply -f k8s/db-phpmyadmin-service.yaml
kubectl -n laravel-app apply -f k8s/php-apache-environment-claim0-persistentvolumeclaim.yaml
```

### Step 12: Create 4th Jenkins job

---

`This job is to delete the cluster`

---

```
eksctl delete <CLUSTER_NAME>
```

### Step 13: Access the application

```
<node-Public IPv4 address>:5000
<node-Public IPv4 address>:4000
```
