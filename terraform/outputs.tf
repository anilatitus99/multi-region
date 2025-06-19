output "primary_bucket" {
  value = google_storage_bucket.bucket_primary.url
}

output "secondary_bucket" {
  value = google_storage_bucket.bucket_secondary.url
}
