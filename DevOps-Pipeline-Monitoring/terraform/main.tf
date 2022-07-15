resource "aws_instance" "ubuntu-instance" {
  ami           = var.ami
  instance_type = "t2.medium"
  key_name      = "mykey"
  security_groups = ["${aws_security_group.UbuntuSG.name}"]

  tags  = {
    Name  = "Ubuntu-EC2"
  }

  root_block_device {
    volume_size           = "20"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }
}


