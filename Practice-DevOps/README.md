# Practice DevOps 
``
Here you will find number of tasks you can do, It will help you practice and use all what you have learnt in the previous videos
``
## 1st Task:

1. Practice the docker commands and understand what they do from the following link: [Docker Commands](https://github.com/johnbedeir/Devops-Tools-Documentation/blob/ad43b1d3e66910758d159813e56c495414f24b8d/Docker/Docker_commands.MD)

2. Create a Dockerfile that pull (Apache or Nginx) image then copy a simple webpage with index.html into the public directory

3. Build image from this Dockerfile

4. Run a container from the built image 

5. Open the localhost with the specified port in the docker run command you should see the webpage you have copied inside the image

6. Create a dockerhub repository

7. Push the created image on the created dockerhub repository

8. Redo the same tasks several times by chaning the image, the Dockerfile or the webpage you create
---

## 2nd Task:

1. Create Ubuntu EC2 instance on AWS and make sure you open a port from the inbound rules (security groups) that you will use to run the container with

2. Connect using SSh on the created EC2 instance using the keypair you created with the EC2

3. Run updates & install docker 

4. Pull the image created in the previous task from dockerhub 

5. Run a container from that image on the port you have oppened in the security group 

6. Use the AWS public DNS to open your webpage on the browser

8. Repeat the task several times 
---

## 3rd Task: 

1. Create ansible-playbook using the following template: [Ansible Playbook Example](https://github.com/johnbedeir/Devops-Tools-Documentation/blob/ad43b1d3e66910758d159813e56c495414f24b8d/Ansible-Playbook/ansible-playbook%20(example).yml)

2. Clean any previous build and containers and run ansible playbook instead  

3. Create a repository on GitHub and push the playbook file, Dockerfile and the webpage index.html file (from the 1st task)
---

## 4th Task:

1. Pull docker image for Jenkins

2. Run container locally using the Jenkins image you pulled 

3. Access the container using the right command specified in the docker commands link in the 1st task to find the default password for Jenkins

4. Access Jenkins on your browser and use the password you get from the container

5. Have a look into Jenkins, Jobs, Plugins and configuration 
---

## 5th Task:

1. Create Ubuntu EC2 instance on AWS (make sure to open port 8080 for Jenkins and another port to run your application on)

2. Connect using SSH on the EC2

3. Install Jenkins on the EC2

4. Access Jenkins from your browser using the AWS public DNS

5. Create a job including your GitHub Repository you did in the 3rd Task

6. Run the ansible-playbook command into jenkins shell execute

7. Configure jenkins to run this task every 1 min so it can trigger any changes in the github repository and publish it

8. Access your webpage from AWS public DNS and the port specified
---

## 6th Task:

1. Create Ubuntu EC2 instance on AWS using Terraform

2. Access the EC2 instance by SSH

3. Install Jenkins on the EC2 with all the dependencies needed

4. Create a jenkins job using your github repository 

5. Run your application container on the same EC2 

6. Once working destroy the EC2 using Terraform 

7. Repeat the task again while changing and adding new services in Terraform using the references in the following link: [Terraform Instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)
---

## 7th Task:

1. Install Minikube, Kubectl and K9s app 

2. Make sure docker is in the sudo group 

3. Assume you have your applicaion and Dockerfile, Build the Dockerfile and Push the created Image to dockerhub 

4. Create Service and Deployment files for Kubernetes in your application 

5. Create namespcae using Kubectl 

6. Deploy your kubernetes service and deployment files using kubectl 

7. Monitor your deployment, service, pods through K9s 

8. Play around with K9s and figureout more fetures and what you can check and change while your application is running
---

## 8th Task:

1. Install AWS-CLI and Eksctl

2. Connect your machine to AWS using ```aws configure | Secret Key | Secret Access Key```

3. Use the same project and kubernetes files from the previous task ```Make sure you change the type in the k8s service to LoadBalancer```
4. Create cluster using eksctl command
5. Create namespace using kubectl command 
6. Deploy your k8s service and deployment files using kubectl command
7. Find the external IP for your application in K9s
7. Monitor your deployment through K9s

## 9th Task:

1. Create Ubuntu EC2 using Terraform``make sure you add your public ssh key in the tfvars file`` 

2. Play with security group and replace values with more variables  
---

## 10th Task:

1. Create Windows EC2 using Terraform 

2. Connect to the EC2 with the RDP ``if you are using linux you can use the following application to connect to the Windows EC2:`` [Download Remmina For Linux](https://remmina.org/how-to-install-remmina/)  
---
## 11th Task:

1. Use application that container backend and database and integrate all the tools that you have done in the previous tasks to build DevOps Pipeline ``could be PHP Laravel & MYSQL App, Nodejs, MongoDB App or Python, Django and PostgreSQL``

2. Create Dockerfile for the application 

3. Create Docker-compose ``to split your application into microservices``

4. Create Ansible Playbook files to automate the Dockerfile & and Docker-compose Build & Run 

5. Push all your files into Git Repository  

6. Create Ubuntu EC2 using Terraform ``make sure you open the needed ports to run Jenkins and your sevices in your application``

7. Connect and Install all the needed tools on the EC2 ``using the following shell script:`` [Install DevOps Tools Script](https://github.com/johnbedeir/Devops-Tools-Documentation/blob/main/DevOps-Pipeline/install.sh)

8. Run Jenkins, Access it and create a job that use your repository and run the ansible playbook of the docker-compose 

9. Configure jenkins to run this task every 1 min so it can trigger any changes in the github repository and publish it

``
More tasks will be added from time to time so you can always find someting to practice on
``