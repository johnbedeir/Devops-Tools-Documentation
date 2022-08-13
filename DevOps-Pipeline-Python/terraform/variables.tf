# Adding the region as a variable, used in provider.tf
variable "region" {
  type    = string 
  description = "this is the region where we will build our machine, region is saved in tfvars"
}

# Adding the ami as a variable, used in main.tf 
variable "ami" {
  type    = string 
  description = "This is the ami for the ubuntu machine that we will use, it is saved in the tfvars"
}

# Create terraform.tfvars and add your public ssh key in 
variable "public_key" {
  description = "ssh public key"
}