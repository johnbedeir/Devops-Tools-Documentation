resource "google_compute_instance" "ubuntu-instance" {
  name         = "ubuntu-gcp"
  machine_type = "e2-medium"
  tags         = ["ubuntu-vm"]

  boot_disk {
    initialize_params {
      image = "debian-11"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
      nat_ip = google_compute_address.static_ip.address
    }
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = var.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  scheduling {
    automatic_restart   = true // This ensures the VM is restarted automatically if it fails
    on_host_maintenance = "MIGRATE"
  }
}

resource "google_compute_snapshot" "default" {
  name        = "gitlab-runner-snapshot"
  source_disk = google_compute_instance.ubuntu-instance.boot_disk.0.source
}

resource "google_compute_image" "default" {
  name            = "gitlab-runner-image"
  source_snapshot = google_compute_snapshot.default.self_link
}
