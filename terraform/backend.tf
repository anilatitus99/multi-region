terraform {
  backend "gcs" {
    bucket = "themulti-tf-state" # replace this later after first manual apply
    prefix = "terraform/state"
  }
}
