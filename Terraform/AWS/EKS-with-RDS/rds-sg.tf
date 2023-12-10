# Create a Security group for the RDS to allow accessing the RDS through the specified port.
resource "aws_security_group" "rds_sg" {
  name   = "${var.rds_cluster_name}-sg"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    self        = true # This allows instances associated with this security group to accept traffic from other instances associated with the same security group.
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow to send TCP traffic on port 3306 to any IP address
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.rds_cluster_name}-sg"
  }
}
