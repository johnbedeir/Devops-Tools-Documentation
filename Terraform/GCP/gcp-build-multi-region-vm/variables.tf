variable "regions" {
  description = "The GCP region where to deploy the VM."
  type        = list(string)
}

variable "network_tags" {
  description = "List of network tags to apply to the VM."
  type        = list(string)
}

variable "vpc_name" {
  description = "The name of the VPC to use."
  type        = string
  default = "my-vpc"
}

variable "machine_type" {
  description = "The machine type of the GCP VM."
  type        = string
}

variable "cpu_platform" {
  description = "Minimum required CPU platform for the VM."
  default     = "Intel Ice Lake"
}

variable "boot_disk_image" {
  description = "The custom image for the boot disk."
  type        = string
}

variable "boot_disk_size_gb" {
  description = "The size of the boot disk in GB."
  default     = 250
}

variable "boot_disk_type" {
  description = "The type of the boot disk."
  default     = "pd-ssd"
}

# for having 2 different subnets use this variable 
# variable "subnets" {
#   description = "A map of regions to subnet configurations"
#   type = map(object({
#     subnet_ip = string
#   }))

#   default = {
#     "europe-west3" = {
#       subnet_ip = "10.0.0.0/20"
#     },
#     "europe-west2" = {
#       subnet_ip = "10.0.16.0/20"
#     }
#   }
# }

variable "subnets" {
  description = "subnet configurations"
  default     = "10.0.0.0/20"
}