# Create a Secret manager to store the RDS credentials.
resource "aws_secretsmanager_secret" "rds_credentials" {
  name        = "${var.rds_cluster_name}-db-secrets"
  description = "RDS DB credentials"
}

# Set the values of the secrets in the Secret manager
resource "aws_secretsmanager_secret_version" "rds_credentials_version" {
  secret_id     = aws_secretsmanager_secret.rds_credentials.id
  secret_string = jsonencode({ "username" : var.db_username, "password" : var.db_password })
}
