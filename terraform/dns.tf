resource "google_dns_managed_zone" "main" {
  name        = "main-zone"
  dns_name    = "themulti.xyz."
  description = "Managed zone for disaster recovery DNS"
}

resource "google_dns_record_set" "primary_record" {
  name         = "app.themulti.xyz."
  managed_zone = google_dns_managed_zone.main_zone.name
  type         = "A"
  ttl          = 300
  rrdatas      = [var.primary_ip]
}

resource "google_dns_record_set" "secondary_record" {
  name         = "app.themulti.xyz."
  managed_zone = google_dns_managed_zone.main_zone.name
  type         = "A"
  ttl          = 300
  rrdatas      = [var.secondary_ip]
}
