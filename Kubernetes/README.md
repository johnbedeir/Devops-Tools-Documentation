# How to install and run kubernetes locally (Ubuntu)
[Watch Kubernetes_Part1 شرح step by step on YouTube](https://youtu.be/YfJZBngbhM8)

[Watch Kubernetes_Part2, شرح Run Kubernetes locally step by step on YouTube](https://youtu.be/kV4jINv3s-k)

[Watch Kubernetes_Part1 شرح Create a Cluster on Cloud step by step on YouTube](https://youtu.be/4Tkxe0VjrYw)

## 1. Intsall [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)

## 2. Intsall [MiniKube](https://minikube.sigs.k8s.io/docs/start/)

## 3. Add Docker to Sudo group:
```bash
# (required) to be able to start minikube
$ sudo groupadd docker

# Add your user to the docker group, replace [user] with your username
$ sudo usermod -aG docker [user] 

# To activate changes to the group
$ newgrp docker
```
## 4. Build, test and push application to dockerhub:

```bash
# (required) build the docker image from the Dockerfile
$ docker build -t comingsoon-img .
```

```bash
# (Optional) you can test the application locally with docker before pushing it to dockerhub to make sure it is working fine
$ docker run -d -p 8000:80 comingsoon-img
$ curl localhost:8000
```

```bash
# to stop and remove container after testing
$ docker stop comingsoon-img
$ docker rm comingsoon-img
```

```bash 
# (required) make sure you logedin to your dockerhub account before you push the image
$ docker login

# (required) tag the image that you will push with your dockerhub user   
$ docker tag comingsoon-img dockerhub.user/comingsoon-img 

# (required) push image to dockerhub
$ docker push dockerhub.user/comingsoon-img
```
## 5. Add Docker to Sudo Group
```bash
# Create the docker group if not exist
$ sudo groupadd docker

# Add user to the docker group
$ sudo usermod -aG docker [user]

# To activate changes to the group
$ newgrp docker

```

## 6. Start MiniKube:

```bash 
minikube start 
```

## 7. Install K9s

### a) Click on the following link: [Download K9s](https://github.com/derailed/k9s/releases)

### b) Unzip the downloaded tar.gz file
``` bash
# Download K9s 
$ sudo tar -xvzf file.tar.gz
```

### c) Install 
``` bash
# Make sure you are into the directory and see the k9s file 
$ sudo install -m 755 k9s /usr/local/bin
```

## 8. Deploy the application:

``` bash
# run deployment.yml & service.yml 
$ kubectl create namespace <namespace-name>
$ kubectl -n <namespace-name> apply -f deployment.yml 
$ kubectl -n <namespace-name> apply -f service.yml 
```

## 9. Get App URL
```bash
minikube service -n <namespace-name> <service-name> --url
```

# How to create and deploy your application on cluster (EKS)

## 1. Connect to your AWS User Account
``` bash
# Get your access key from (your AWS account > IAM service > the user you will use > security credintials > create access key)
aws configure
```

## 2. Intsall [aws-cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

## 3. Intsall [eksctl](https://docs.aws.amazon.com/emr/latest/EMR-on-EKS-DevelopmentGuide/setting-up-eksctl.html)

## 4. Create Cluster on AWS:
``` bash
# access your website locally in your browser
eksctl create cluster --name <cluster-name> --nodes-min=2
```

## 5. Make sure you have the same namespace in your manifest files
```bash
kubectl create namespace <namespace-name>
```

## 6. In the services.yaml change the type from NodePort to LoadBalanced 
``` bash
# Since we will be working on the cloud we will need to change the service type to get an external IP for our application
```
## 7. Deploy your application:
``` bash
kubectl -n <namespace-name> apply -f deployment.yml 
kubectl -n <namespace-name> apply -f service.yml 
```

## 8. Access your application:
``` bash
# 1. Run K9s and go to services
# 2. Copy the external IP to your browser
```

## 8. Delete your cluster
``` bash
eksctl delete cluster <cluster-name>
```