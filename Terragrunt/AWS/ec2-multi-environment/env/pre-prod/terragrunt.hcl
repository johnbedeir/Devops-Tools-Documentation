include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/ec2"
}

inputs = {
  ec2_name      = "pre-prod-ec2"
  # key_name      = "pre-prod-key"
}
