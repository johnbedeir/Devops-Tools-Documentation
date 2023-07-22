variable "db_username" {
  description = "The username for the DB instance"
  type        = string

}

variable "db_password" {
  description = "The password for the DB instance"
  type        = string
  sensitive   = true
}

variable "rds_cluster_name" {
  type    = string
  default = "rds-cluster"
}

variable "rds_instance_name" {
  type    = string
  default = "rds-instance"
}

variable "rds_engine" {
  type    = string
  default = "aurora-mysql"
}

variable "db_name" {
  type    = string
  default = "mydatabase"
}

variable "rds_engine_version" {
  type    = string
  default = "8.0.mysql_aurora.3.02.0"
}
