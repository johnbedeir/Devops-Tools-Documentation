# Create RDS Cluster
resource "aws_rds_cluster" "rds_cluster" {
  cluster_identifier      = var.rds_cluster_name
  engine                  = var.rds_engine
  engine_version          = var.rds_engine_version
  database_name           = var.db_name
  master_username         = var.db_username
  master_password         = var.db_password
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"

  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name

  skip_final_snapshot = false

  final_snapshot_identifier = "${var.rds_cluster_name}-snapshot"

  tags = {
    Name = "${var.rds_cluster_name}"
  }
}

# Create RDS Instances with the RDS cluster
resource "aws_rds_cluster_instance" "rds_instances" {
  count                = 1
  identifier           = "${var.rds_instance_name}-${count.index}"
  cluster_identifier   = aws_rds_cluster.rds_cluster.id
  instance_class       = "db.r5.large"
  engine               = var.rds_engine
  engine_version       = var.rds_engine_version
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  publicly_accessible  = true
}
