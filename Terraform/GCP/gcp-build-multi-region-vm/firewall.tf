resource "google_compute_firewall" "allow_http" {
  for_each     = toset(var.regions)
  name    = "allow-http-${each.key}"
  network = google_compute_network.my_vpc[each.key].name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = var.network_tags
}

resource "google_compute_firewall" "allow_https" {
  for_each     = toset(var.regions)
  name    = "allow-https-${each.key}"
  network = google_compute_network.my_vpc[each.key].name

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = var.network_tags
}
