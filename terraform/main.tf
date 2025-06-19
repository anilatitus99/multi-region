provider "google" {
  project = var.project_id
  region  = var.primary_region
}

resource "google_compute_network" "vpc_primary" {
  name                    = "vpc-primary"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet_primary" {
  name          = "subnet-primary"
  ip_cidr_range = "10.0.0.0/24"
  region        = var.primary_region
  network       = google_compute_network.vpc_primary.id
}

resource "google_compute_network" "vpc_secondary" {
  name                    = "vpc-secondary"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet_secondary" {
  name          = "subnet-secondary"
  ip_cidr_range = "10.1.0.0/24"
  region        = var.secondary_region
  network       = google_compute_network.vpc_secondary.id
}

resource "google_storage_bucket" "bucket_primary" {
  name     = "${var.project_id}-bucket-pri"
  location = var.primary_region
  versioning {
    enabled = true
  }
}

resource "google_storage_bucket" "bucket_secondary" {
  name     = "${var.project_id}-bucket-sec"
  location = var.secondary_region
  versioning {
    enabled = true
  }
}

resource "google_dns_managed_zone" "main_zone" {
  name        = "main-zone"
  dns_name    = "themulti.xyz." # replace with your domain
  description = "Public zone for DR failover"
}
