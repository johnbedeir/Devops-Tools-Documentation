variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "ami_id" {
  type    = string
  default = "ami-0d527b8c289b4af7f"
}

variable "ssh_publickey_path" {
  type = string
}