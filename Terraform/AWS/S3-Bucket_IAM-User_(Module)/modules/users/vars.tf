variable "BUCKETNAME" {
  type    = string
  default = "k10-cluster-backup"
}

variable "user" {
  type        = string
  default     = "k10-user"
  description = "IAM user name"
}

variable "user_policy" {
  type        = string
  default     = "k10-user-policy"
  description = "IAM user policy for accessing the S3 Bucket"
}