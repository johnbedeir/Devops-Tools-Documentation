# Create EC2 instance within the range of the VPC to be able to communicate with the RDS through the Proxy
resource "aws_instance" "rds_ec2" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_type
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  subnet_id                   = aws_subnet.ec2_subnet_c.id
  associate_public_ip_address = true
  key_name                    = "ec2-rds-key"
  tags = {
    Name = "${var.ec2_name}"
  }
}




