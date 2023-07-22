# Create a gateway to the VPC
resource "aws_internet_gateway" "rds_igw" {
  vpc_id = aws_vpc.rds_vpc.id

  tags = {
    Name = "${var.rds_cluster_name}-igw"
  }
}

