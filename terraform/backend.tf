terraform {
  backend "gcs" {
    bucket = "themulti-tf-state" 
    prefix = "terraform/state"
  }
}
