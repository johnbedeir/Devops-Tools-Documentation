resource "aws_instance" "ubuntu-instance" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = var.ec2_name
  }
}
