resource "google_compute_network" "my_vpc" {
  for_each                = toset(var.regions)
  name                    = "${var.vpc_name}-${each.key}"
  auto_create_subnetworks = false # Important to set this to false to manually create subnets
}

resource "google_compute_address" "vm_internal_ip" {
  for_each = toset(var.regions)
  name         = "vm-internal-ip-${each.key}"
  region       = each.value
  subnetwork   = google_compute_subnetwork.my_subnet[each.key].name
  address_type = "INTERNAL"
  purpose      = "GCE_ENDPOINT"
}

resource "google_compute_address" "vm_external_ip" {
  for_each = toset(var.regions)
  name   = "vm-external-ip-${each.key}"
  region = each.value
}

resource "google_compute_subnetwork" "my_subnet" {
  for_each          = toset(var.regions)
  name              = "my-subnet-${each.key}"
  region            = each.key
  network           = google_compute_network.my_vpc[each.key].name
  ip_cidr_range     = var.subnets
}
