# DevOps Tasks 

## Task 1:

1. Practice the docker commands and understand what they do from the following link: [Docker-Commands](https://github.com/johnbedeir/Devops-Tools-Documentation/blob/main/Docker/Docker%20commands.MD)

2. Create Dockerfile that pull (Apache or Nginx) image then copy a simple webpage with index.html into the public directory

3. Run a container from the built image 

4. Access localhost with the specified port in the docker run command to see the webpage you’ve copied inside

5. Create a dockerhub repository

6. Push the created image on the created dockerhub repository 

## Task 2:

1. Create Ubuntu EC2 instance on AWS 
2. Connect using SSh on the created EC2 instance 
3. Update & install docker 
4. Pull the image created in the previous task from dockerhub 
5. Run a container from that image 
6. Use the AWS public DNS to open your webpage on the browser 

## Task 3:

1. Create ansible-playbook using the following template: [Ansible-Playbook-Template](https://github.com/johnbedeir/Devops-Tools-Documentation/tree/main/Ansible-Playbook)

2. Clean any previous build and containers and run ansible playbook instead  
3. Create a repository on GitHub and push your files 

## Task 4: 

1. Pull docker image for Jenkins and 
2. Run container locally from the Jenkins image you pulled 
3. Access the container using the docker commands in the 1st task 
4. Access Jenkins on your browser and find the default password from inside the container you just created
5. Have a look into Jenkins, Jobs, Plugins and configuration 

## Task 5: 

1. Create Ubuntu EC2 instance on AWS 
2. Connect using SSH on the EC2 
3. Install updates and Jenkins 
4. Access Jenkins from your browser using the AWS public DNS 
5. Create a job including your GitHub Repository you did in the 3rd Task 
6. Run the ansible-playbook command into jenkins 
7. Configure jenkins to run this task every 1 min so it can trigger any changes in the github repository and publish it 
8. Access your webpage from AWS public DNS and the port specified

