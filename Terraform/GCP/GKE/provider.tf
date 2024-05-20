terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.5"
    }
    random = {
      source = "hashicorp/random"
    }
  }

  required_version = ">= 0.12"
}

provider "google" {
  credentials = file("gcp-credentials.json")
  project     = var.project_id
  region      = var.region
}

provider "kubernetes" {
  host  = google_container_cluster.primary.endpoint
  token = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(
    google_container_cluster.primary.master_auth[0].cluster_ca_certificate,
  )
}

provider "helm" {
  kubernetes {
    host  = google_container_cluster.primary.endpoint
    token = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(
      google_container_cluster.primary.master_auth[0].cluster_ca_certificate,
    )
  }
}

data "google_client_config" "default" {}
