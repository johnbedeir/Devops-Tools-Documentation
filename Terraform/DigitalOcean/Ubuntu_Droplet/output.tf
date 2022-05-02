output "droplet_ip_address" {
  value = digitalocean_droplet.test.ipv4_address
}