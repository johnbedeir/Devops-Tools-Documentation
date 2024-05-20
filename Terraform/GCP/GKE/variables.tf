
variable "project_id" {
  description = "The name of the VPC to use."
  type        = string
  default     = "PROJECT_ID"
}


variable "region" {
  description = "The name of the VPC to use."
  type        = string
  default     = "REGION"
}

variable "name_prefix" {
  description = "The name of the VPC to use."
  type        = string
  default     = "CLUSTER_NAME"
}

variable "environment" {
  type    = string
  default = "ENV_NAME"
}
