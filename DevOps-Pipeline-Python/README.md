# Deploy Python App on K8s Cluster Using Jenkins Pipeline

This project is to build Jenkins EC2 on AWS and use Jenkins to run our Jenkinsfile to deploy our python application

## Step 1: Jenkins EC2:

`NOTE: Make sure you have terraform installed, create terraform.tfvars file with the variables (ec2-ami, region & your public ssh key) then do the following:`

```
cd terraform

terraform init

terraform apply -auto-approve
```

## Step 2: Prerequisites:

`NOTE: replace the public-ip with the` **instance_public_ip** `that will showup in terraform output`

```
ssh ubuntu@public-ip

vim install.sh

chmod +x install.sh

./install.sh
```

## Step 3: Setup Jenkins:

1. Navigate to **Manage Jenkins** >> **Manage Plugins** >> **Available tab** >> search for **CloudBees AWS Credentials** >> **Install without Restart**

2. Navigate to **Manage Jenkins** >> **Manage Credentials** >> **global** >> **Global Credentials** >> **Add Credentials**

3. Add AWS Credentials, repeat step 2 again to add Github credentials

## Step 4: Create Jenkins Pipeline:

1. Navigate to **Dashboard** >> **Create a Job**

2. Give it a name >> Choose Pipeline

3. **Pipeline** Tab >> Choose **Pipeline Script from SCM** >> Choose **Git** >> Add **Repository URL** >> Add **Credentails** >> Specify the **Branch** >> Then the **Jenkinsfile** path inside the repository

4. Run the created job >> Create 2 similar jobs that navigate to **Jenkins-Deploy/Jenkinsfile** that will run automatically after Job one is done and **Jenkins-RM-EKS/Jenkinsfile** that you will use to remove your cluster

## Step 5: Access your application:

`Note: After the 2nd Jenkins job run and the application is deployed`

Navigate to the 2nd job >> **Console Output** >> Get your **Application URL** which you will found in the end next to **DNSNAME**.

It should look something like this (use the application port to access your app, we used here port _8000_ ):

```
a0e6e955cb648xxxxxxxxxxxx-xxxxxx025.REGION.elb.amazonaws.com:8000
```
