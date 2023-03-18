resource "aws_instance" "ubuntu-instance" {
  ami             = var.ami
  instance_type   = "t2.medium"
  key_name        = "mykey"
  security_groups = ["${aws_security_group.UbuntuSG.name}"]

  tags = {
    Name = "Jenkins-EC2"
  }

  root_block_device {
    volume_size           = "20"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }

  # This section is to provision the EC2 and install a script file while building the EC2,
  # due to interactions that has to be made while the installation is processing this sections will not be the best for this project

  # provisioner "remote-exec" {
  #   inline = [
  #     "curl -O https://github.com/johnbedeir/Devops-Tools-Documentation/blob/dev/DevOps-Pipeline-Monitoring/install.sh",
  #     "chmod +x install.sh",
  #     "./install.sh"
  #   ]

  #   connection {
  #     type        = "ssh"
  #     user        = "ubuntu"
  #     private_key = file("./mykey.pem")
  #     host        = aws_instance.ubuntu-instance.public_ip
  #   }
  # }
}
