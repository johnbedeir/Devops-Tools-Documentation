resource "google_compute_address" "external_ip" {
  name = "${var.name_prefix}-${var.environment}-external-ip"
}


resource "google_compute_network" "vpc_network" {
  name                    = "${var.name_prefix}-${var.environment}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public_subnet" {
  name          = "${var.name_prefix}-${var.environment}-public-subnet"
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.vpc_network.self_link

  // Enables VMs in this subnet to be assigned public IPs
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "private_subnet" {
  name          = "${var.name_prefix}-${var.environment}-private-subnet"
  ip_cidr_range = "10.0.2.0/24"
  network       = google_compute_network.vpc_network.self_link

  // Ensures VMs in this subnet cannot be assigned public IPs
  private_ip_google_access = true
}
