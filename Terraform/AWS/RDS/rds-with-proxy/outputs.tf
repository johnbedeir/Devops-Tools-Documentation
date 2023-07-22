output "rds_cluster_endpoint" {
  value = aws_rds_cluster.rds_cluster.endpoint
}

output "rds_cluster_port" {
  value = aws_rds_cluster.rds_cluster.port
}

output "rds_proxy_endpoint" {
  description = "The endpoint for the RDS proxy"
  value       = aws_db_proxy.rds_proxy.endpoint
}

output "ec2_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.rds_ec2.public_ip
}
