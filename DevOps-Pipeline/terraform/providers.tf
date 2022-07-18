# Adding AWS credentials ans set the region 
provider "aws" {
  profile = "default"
  region  = var.region
}