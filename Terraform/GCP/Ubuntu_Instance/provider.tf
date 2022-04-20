provider "google" {
  credentials = file("gcp-credentials.json")
  project     = var.project
  region      = var.region
  zone        = var.zone
}