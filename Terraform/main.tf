provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_instance" "ubuntu-instence" {
  ami               = var.ami_id
  instance_type     = "t2.micro"
  security_groups   = ["${aws_security_group.UbuntuSG.name}"]
  key_name          = "mykey"

  tags = {
    Name = "Ubuntu-EC2"
  }
}