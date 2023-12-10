resource "google_compute_address" "static_ip" {
  name = "vm-static-ip"
}

resource "google_compute_firewall" "gitlab_outbound" {
  name               = "allow-gitlab-runner-outbound"
  network            = "default"
  direction          = "EGRESS"
  destination_ranges = ["0.0.0.0/0"] # Allows outbound traffic to all IPs

  allow {
    protocol = "tcp"
    ports    = ["27017"] # The port used by MongoDB Atlas
  }

  target_tags = ["gitlab-runner"]
}
