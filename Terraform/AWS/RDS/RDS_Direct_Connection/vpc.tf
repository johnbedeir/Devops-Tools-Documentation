# Create a VPC
resource "aws_vpc" "rds_vpc" {
  cidr_block = "10.0.0.0/16"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.rds_cluster_name}-vpc"
  }
}

