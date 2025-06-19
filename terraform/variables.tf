variable "project_id" {
  default = "multi-region-dr" # or your actual GCP project ID
}
variable "primary_region" {
  default = "us-central1"
}
variable "secondary_region" {
  default = "us-east1"
}

variable "primary_ip" {
  type = string
}

variable "secondary_ip" {
  type = string
}
