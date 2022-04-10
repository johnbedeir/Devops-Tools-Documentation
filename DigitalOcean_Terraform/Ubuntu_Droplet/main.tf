# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "test" {
  image  = "ubuntu-18-04-x64"
  name   = "ubuntu-test"
  region = "fra1"
  size   = "s-1vcpu-1gb"
}
