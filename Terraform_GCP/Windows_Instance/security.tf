# create VPC
resource "google_compute_network" "vpc" {
  name                    = "kopicloud-vpc"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}

# create public subnet
resource "google_compute_subnetwork" "network_subnet" {
  name          = "kopicloud-subnet"
  ip_cidr_range = var.network-subnet-cidr
  network       = google_compute_network.vpc.name
}

# Allow http
resource "google_compute_firewall" "allow-http" {
  name    = "kopicloud-fw-allow-http"
  network =  google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http"]
}

# allow rdp
resource "google_compute_firewall" "allow-rdp" {
  name    = "kopicloud-fw-allow-rdp"
  network =  google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["rdp"]
}