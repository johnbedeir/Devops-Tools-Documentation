variable "project" {
  default = "sylvan-earth-317512"
}

variable "region" {
  default = "europe-west4"
}

variable "zone" {
  default = "europe-west4-a"
}

variable "network-subnet-cidr" {
  type        = string
  description = "The CIDR for the network subnet"
}

variable "windows_2012_r2_sku" {
  type        = string
  description = "SKU for Windows Server 2012 R2"
  default     = "windows-cloud/windows-2012-r2"
}

variable "windows_2016_sku" {
  type        = string
  description = "SKU for Windows Server 2016"
  default     = "windows-cloud/windows-2016"
}

variable "windows_2019_sku" {
  type        = string
  description = "SKU for Windows Server 2019"
  default     = "windows-cloud/windows-2019"
}

variable "windows_2022_sku" {
  type        = string
  description = "SKU for Windows Server 2022"
  default     = "windows-cloud/windows-2022"
}

variable "windows_instance_type" {
  type        = string
  description = "VM instance type for Windows Server"
  default     = "n2-standard-2"
}