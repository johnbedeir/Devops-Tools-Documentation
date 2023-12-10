output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane."
  value       = module.eks.cluster_security_group_id
}

output "rds_cluster_endpoint" {
  value = aws_rds_cluster.rds_cluster.endpoint
}

output "rds_cluster_port" {
  value = aws_rds_cluster.rds_cluster.port
}

output "db_username" {
  sensitive = true
  value     = var.db_username
}

output "db_password" {
  sensitive = true
  value     = var.db_password
}

output "final_snapshot_name" {
  description = "The name of the final snapshot created when the RDS cluster is deleted"
  value       = aws_rds_cluster.rds_cluster.final_snapshot_identifier
}
