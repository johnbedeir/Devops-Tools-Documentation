# Common provider configuration (if applicable)
terraform {
  extra_arguments "common_vars" {
    commands = get_terraform_commands_that_need_vars()

    arguments = [
      "-var-file=${get_terragrunt_dir()}/../../common.tfvars"
    ]
  }
}

# Shared inputs
inputs = {
    ami           = "ami-0faab6bdbac9486fb"
    instance_type = "t2.micro"
}
