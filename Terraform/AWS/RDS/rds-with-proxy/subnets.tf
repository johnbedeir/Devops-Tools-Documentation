# RDS Subnets
resource "aws_subnet" "rds_subnet_a" {
  vpc_id            = aws_vpc.rds_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "${var.rds_cluster_name}-subnet-a"
  }
}

resource "aws_subnet" "rds_subnet_b" {
  vpc_id            = aws_vpc.rds_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-central-1b"

  tags = {
    Name = "${var.rds_cluster_name}-subnet-b"
  }
}

# EC2 Subnet
resource "aws_subnet" "ec2_subnet_c" {
  vpc_id            = aws_vpc.rds_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-central-1c"

  tags = {
    Name = "${var.ec2_name}-subnet-c"
  }
}

# Subnet group for the RDS subnets
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.rds_cluster_name}-subnet-group"
  subnet_ids = [aws_subnet.rds_subnet_a.id, aws_subnet.rds_subnet_b.id]

  tags = {
    Name        = "${var.rds_cluster_name}-subnet-group"
    Environment = "testing"
  }
}
