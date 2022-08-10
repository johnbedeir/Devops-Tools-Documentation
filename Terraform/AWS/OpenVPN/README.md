# Creating OpenVPN on AWS

## Step 1: Building

After cloning the repository

```
cd Terraform/AWS/OpenVPN
```

Create 'Terraform.tfvars' and add your public ssh key in as shown:

```
public_key="ADD-HERE"
```

Building the instances

`You may need to run the apply twice so it will create the key pair pem file`

```
terraform init

terraform apply -auto-approve
```

## Step 2: Configuring

Connect to the EC2 using the output public IP that will showup in the terminal after terraform build the EC2

```
ssh -i vpn.pem root@<public-ip>
```

### `1. Once connected the setup will take you through choices yes or no, type yes and for the default values hit Enter, then it will disconnect and ask you to connect again using username` _openvpnas_

```
ssh -i vpn.pem openvpnas@<public-ip>
```

### `2. Then switch to root using the following command:`

```
sudo su -
```

### `3. Change the password for the username:` _openvpn_ `Enter the new password and repeat it`

```
passwd openvpn
```

## Step 3: Access OpenVPN

### `1. Now you can access OpenVPN from the browser using the URL that was showed up`

```
http://<public-ip>:943/admin
```

### `2. Login using the username:` _openvpn_ and the _password_ you have created
