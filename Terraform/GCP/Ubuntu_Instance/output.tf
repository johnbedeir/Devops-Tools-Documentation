output "internal_IP" {
  value = google_compute_instance.ubuntu-instance.network_interface.0.network_ip
}

output "external_IP" {
  value = google_compute_instance.ubuntu-instance.network_interface.0.access_config.0.nat_ip
}


