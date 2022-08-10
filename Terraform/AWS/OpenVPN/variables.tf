variable "region" {
  type    = string 
  default = "eu-central-1"
}

variable "ami" {
  type    = string 
  default = "ami-0764964fdfe99bc31"
}

variable "public_key" {
  description = "ssh public key"
}