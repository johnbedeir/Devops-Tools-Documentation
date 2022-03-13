# In this project we can't use the free tier t2.micro since we will be running many service on this machine so we will use t2.medium 
resource "aws_instance" "ubuntu-instance" {
  ami           = var.ami
  instance_type = "t2.medium"
  key_name      = "mykey"
  security_groups = ["${aws_security_group.UbuntuSG.name}"]

  tags  = {
    Name  = "Ubuntu-EC2"
  }

# The default storage size of the created EC2 will be 8GB SSD and since we will be running minikube, kubectl and docker we will need more storage 
# So in this example we will make the storage 30GB which is the maximum free storage you can use
  root_block_device {
    volume_size = 30
    volume_type = "gp2"
    encrypted   = false
  }
}


