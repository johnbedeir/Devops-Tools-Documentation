variable "region" {
  type    = string 
  default = "eu-central-1"
}

variable "ami" {
  type    = string 
  default = "ami-015c25ad8763b2f11"
}

variable "public_key" {
  description = "ssh public key"
}