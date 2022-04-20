resource "google_compute_instance" "windows_vm" {
  name         = "windows-vm"
  machine_type = var.windows_instance_type
  zone         = var.zone
  # hostname     = "kopicloud-vm.kopicloud.com"
  tags         = ["rdp", "http"]

  boot_disk {
    initialize_params {
      image = var.windows_2022_sku
    }
  }

  # metadata = {
  #   sysprep-specialize-script-ps1 = data.template_file.windows-metadata.rendered
  # }

  network_interface {
    network    = "default"
    # subnetwork = google_compute_subnetwork.network_subnet.name
    access_config {}
  }
}