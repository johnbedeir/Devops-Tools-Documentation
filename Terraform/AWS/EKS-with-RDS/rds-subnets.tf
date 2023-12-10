# Subnet group for the RDS subnets
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.rds_cluster_name}-subnet-group"
  subnet_ids = module.vpc.public_subnets

  tags = {
    Name        = "${var.rds_cluster_name}-subnet-group"
    Environment = "testing"
  }
}
