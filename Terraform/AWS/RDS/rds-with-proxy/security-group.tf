# Create a Security group for the RDS to allow accessing the RDS through the specified port.
resource "aws_security_group" "rds_sg" {
  name   = "${var.rds_cluster_name}-sg"
  vpc_id = aws_vpc.rds_vpc.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    self            = true # This allows instances associated with this security group to accept traffic from other instances associated with the same security group.
    security_groups = [aws_security_group.ec2_sg.id]
  }

  # Allow to send TCP traffic on port 3306 to any IP address
  egress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    self        = true
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.rds_cluster_name}-sg"
  }
}

# Security group for the EC2 to be able to access it through SSH from any IP address.
resource "aws_security_group" "ec2_sg" {
  name   = "${var.ec2_name}-sg"
  vpc_id = aws_vpc.rds_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.ec2_name}-sg"
  }
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2-kp" {
  key_name   = "ec2-rds-key"
  public_key = var.public_key

  provisioner "local-exec" {
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./ec2-rds-key.pem"
  }
}
