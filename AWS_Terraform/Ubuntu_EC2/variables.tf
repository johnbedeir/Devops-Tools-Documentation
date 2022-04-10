variable "region" {
  type    = string 
  default = ""
}

variable "ami" {
  type    = string 
  default = "a"
}

variable "public_key" {
  description = "ssh public key"
}