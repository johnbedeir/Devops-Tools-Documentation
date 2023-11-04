output "internal_IP" {
  value = google_compute_instance.ubuntu-instance.network_interface.0.network_ip
}

output "static_ip" {
  value = google_compute_address.static_ip.address
}
