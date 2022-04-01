# Practice DevOps 
``
Here you will find number of tasks you can do, It will help you practice and use all what you have learnt in the previous videos
``
## First Task:
```
1. Practice the docker commands and understand what they do from the following link:https://github.com/johnbedeir/Devops-Tools-Documentation/blob/main/Docker/Docker%20commands.MD

2. Create a Dockerfile that pull (Apache or Nginx) image then copy a simple webpage with index.html into the public directory

3. Build image from this Dockerfile

4. Run a container from the built image 

5. Open the localhost with the specified port in the docker run command to see the webpage you’ve copied inside

6. Create a dockerhub repository

7. Push the created image on the created dockerhub repository 
```
---
## Second Task:
```
1. Create Ubuntu EC2 instance on AWS 

2. Connect using SSh on the created EC2 instance 

3. Update & install docker 

4. Pull the image created in the previous task from dockerhub 

5. Run a container from that image 

6. Use the AWS public DNS to open your webpage on the browser 

```
---
## Third Task: 
```
1. Create ansible-playbook using the following template:https://github.com/johnbedeir/Devops-Tools-Documentation/tree/main/Ansible-Playbook

2. Clean any previous build and containers and run ansible playbook instead  

3. Create a repository on GitHub and push your files 
```
---
## Fourth Task:
```
1. Pull docker image for Jenkins and 

2. Run container locally from the Jenkins image you pulled 

3. Access the container using the docker commands in the 1st task 

4. Access Jenkins on your browser and find the default password from inside the container you just created

5. Have a look into Jenkins, Jobs, Plugins and configuration 
```
---
## Fifth Task:
```
1. Create Ubuntu EC2 instance on AWS

2. Connect using SSH on the EC2

3. Install Jenkins on the EC2

4. Access Jenkins from your browser using the AWS public DNS

5. Create a job including your GitHub Repository you did in the 3rd Task

6. Run the ansible-playbook command into jenkins

7. Configure jenkins to run this task every 1 min so it can trigger any changes in the github repository and publish it

8. Access your webpage from AWS public DNS and the port specified
```
---
## Sixth Task:
```
1. Create Ubuntu EC2 instance on AWS using Terraform

2. Access the EC2 instance through terminal 

3. Install Jenkins on the EC2 with all the dependencies  needed

4. Create a jenkins job using your github repository 

5. Run your application container on the same EC2 

6. Once working destroy the EC2 using Terraform 

7. Repeat the task again while changing and adding new services in Terraform using the references in the following link: 
```
[Terraform Instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)

---

``
More tasks will be added from time to time so you can always find someting to practice on
``