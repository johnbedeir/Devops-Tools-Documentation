include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/ec2"
}

inputs = {
  ec2_name      = "prod-ec2"
}
