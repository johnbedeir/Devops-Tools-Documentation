# Steps to deploy website on AWS
[Watch AWS شرح step by step on YouTube](https://youtu.be/NeGdfKEXA-E)

Step 1:

Create AWS account & Sign In: 
```sh
https://aws.amazon.com/
```

Step 2:

```sh
Create S3 bucket 
```

Step 3:

```sh
Create Key Pair 

Download the .pem file
```

Step 4:

```sh
Create EC2 Instence 
```

Step 5:

Install SSH locally

```sh
$ sudo apt install ssh
```

Step 6:

Check the SSH config file

```sh
$ sudo vim /etc/ssh/ssh_config
```

Make sure to have the following lines uncommented in /etc/ssh/ssh_config.d file:
```sh
PasswordAuthentication yes 

ChallengeResponseAuthentication no

PubkeyAuthentication yes

GSSAPIAuthentication yes

```

Step 7:

If you edit in ssh_config file then run the following command:

```sh
$ systemctl restart ssh
```

Step 8:

Connect to EC2 Insctence:

```sh
# Make sure you are in the directory where you've downloaded the .pem file 

$ ssh -i file.pem ec2-user@<Public IPv4 address>
```


Step 9:

Switch to root > install updates > install apache:

```sh
$ sudo su 
$ yum update -y
$ yum install httpd -y
$ service httpd start
```

Step 10:

Navigate to the following directory:

```sh
$ cd var/www/html
```

Step 11:

Download the .zip file using the S3 bucket URL:

```sh
$ wget <S3 bucket URL> # Make sure the S3 bucket is set to public to be able to download it on the EC2
```

Step 12:

Unzip the file:

```sh
$ unzip <file.zip>
```

Step 13:

Move files of the project into the current directory:

```sh
$ mv directory/* .
```