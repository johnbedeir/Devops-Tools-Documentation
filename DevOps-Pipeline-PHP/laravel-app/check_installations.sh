#!/bin/bash

# Check Java
echo "Checking Java installation..."
java -version
if [ $? -eq 0 ]; then
    echo "Java installed successfully."
else
    echo "Java installation failed."
fi

# Check Python
echo "Checking Python installation..."
python3 --version
if [ $? -eq 0 ]; then
    echo "Python installed successfully."
else
    echo "Python installation failed."
fi

# Check Pip
echo "Checking Pip installation..."
pip3 --version
if [ $? -eq 0 ]; then
    echo "Pip installed successfully."
else
    echo "Pip installation failed."
fi

# Check Jenkins
echo "Checking Jenkins installation..."
jenkins --version
if [ $? -eq 0 ]; then
    echo "Jenkins installed successfully."
else
    echo "Jenkins installation failed."
fi

# Check Docker
echo "Checking Docker installation..."
docker --version
if [ $? -eq 0 ]; then
    echo "Docker installed successfully."
else
    echo "Docker installation failed."
fi

# Check Ansible
echo "Checking Ansible installation..."
ansible --version
if [ $? -eq 0 ]; then
    echo "Ansible installed successfully."
else
    echo "Ansible installation failed."
fi

# Check Docker Compose
echo "Checking Docker Compose installation..."
docker-compose --version
if [ $? -eq 0 ]; then
    echo "Docker Compose installed successfully."
else
    echo "Docker Compose installation failed."
fi

# Check eksctl
echo "Checking eksctl installation..."
eksctl version
if [ $? -eq 0 ]; then
    echo "eksctl installed successfully."
else
    echo "eksctl installation failed."
fi

# Check kubectl
echo "Checking kubectl installation..."
kubectl version --client
if [ $? -eq 0 ]; then
    echo "kubectl installed successfully."
else
    echo "kubectl installation failed."
fi

# Check minikube
echo "Checking minikube installation..."
minikube version
if [ $? -eq 0 ]; then
    echo "minikube installed successfully."
else
    echo "minikube installation failed."
fi

# Check k9s
echo "Checking k9s installation..."
k9s version
if [ $? -eq 0 ]; then
    echo "k9s installed successfully."
else
    echo "k9s installation failed."
fi

# Check aws-cli
echo "Checking aws-cli installation..."
aws --version
if [ $? -eq 0 ]; then
    echo "aws-cli installed successfully."
else
    echo "aws-cli installation failed."
fi

# Check kompose
echo "Checking kompose installation..."
kompose version
if [ $? -eq 0 ]; then
    echo "kompose installed successfully."
else
    echo "kompose installation failed."
fi

# Check azure-cli
echo "Checking azure-cli installation..."
az --version
if [ $? -eq 0 ]; then
    echo "azure-cli installed successfully."
else
    echo "azure-cli installation failed."
fi

# Check terraform
echo "Checking terraform installation..."
terraform --version
if [ $? -eq 0 ]; then
    echo "terraform installed successfully."
else
    echo "terraform installation failed."
fi
