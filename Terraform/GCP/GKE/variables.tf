
variable "project_id" {
  description = "The name of the VPC to use."
  type        = string
  default     = "johnydev"
}


variable "region" {
  description = "The name of the VPC to use."
  type        = string
  default     = "europe-west1"
}

variable "name_prefix" {
  description = "The name of the VPC to use."
  type        = string
  default     = "cluster-1"
}

variable "environment" {
  type    = string
  default = "testing-env"
}
