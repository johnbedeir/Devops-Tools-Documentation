# Create Jenkins EC2 on AWS using Terraform | Run Jenkins Pipeline using Jenkinsfile
[Watch Terraform_Part1 شرح on YouTube](https://youtu.be/zF_N4flz8lw)

[Watch Terraform_Part2 شرح on YouTube](https://youtu.be/V6CPs_C9v8A)

[Watch Jenkins شرح on YouTube](https://youtu.be/awqwdGM_Trw)


## Step 1:
### Build AWS EC2 Instance
```
cd Terraform-Ubuntu-EC2/

terraform init

terraform plan

terraform apply
```
---
## Step 2:
### Install Jenkins and other dependencies
```bash
# SSH to the EC2 using the keypair, Create sh file with the commands as shown in the install.sh file 
vim install.sh
chmod +x install.sh 
./install.sh
```
## Step 3:
### Setup Jenkins
```bash
# Access Jenkins using the EC2 IPv4-Public-DNS:8080
```
---

## Step 4:
### Add Github and Dockerhub credentials in Jenkins
`Manage Jenkins > Manage Credentials > Global > Add Credentials`

Make sure to use Dockerhub access token instaed of the password
`Dockerhub > Account Settings > Security > New Access Token`

---
## Step 5: 
### Create Jenkins Pipeline 
`Choose pipeline, if not found you can install it from Manage Jenkins > Manage Plugins`

In **Pipeline Section** in the end of the page choose **Pipeline script from SCM** > Add **Gihub Repository link** > Using **Github Credentials**

`Make usre you choose the right branch and the right path of the Jenkinsfile`

---

