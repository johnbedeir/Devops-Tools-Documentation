data "google_compute_zones" "available" {
  for_each = toset(var.regions)
  region   = each.value
}

resource "google_compute_instance" "vm_instance" {
  for_each     = toset(var.regions)
  name         = "vm-${var.machine_type}-${each.key}"
  machine_type = var.machine_type
  zone         = data.google_compute_zones.available[each.key].names[0] # based on the data it will choose the first available zone

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
      size  = var.boot_disk_size_gb
      type  = var.boot_disk_type
    }
  }

  network_interface {
    network = google_compute_network.my_vpc[each.key].name
    subnetwork = google_compute_subnetwork.my_subnet[each.key].name
    
    access_config {
      nat_ip = google_compute_address.vm_external_ip[each.key].address
    }

    network_ip = google_compute_address.vm_internal_ip[each.key].address
  }

  scheduling {
    preemptible       = false
    on_host_maintenance = "MIGRATE"
    automatic_restart = true
  }

  tags = var.network_tags

  shielded_instance_config {
    enable_secure_boot          = true
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }

  metadata = {
    enable-oslogin = "TRUE"
  }
}
