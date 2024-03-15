resource "google_compute_firewall" "allow_http" {
  name = "allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports = [80]
  }

  source_ranges = ["0.0.0.0/0"]  # Allowing traffic from anywhere
  target_tags = ["allow-http"]
}

resource "google_compute_firewall" "allow_https" {
  name = "allow-https"
  network = "default"

  allow {
    protocol = "tcp"
    ports = [443]
  }

  source_ranges = ["0.0.0.0/0"]  # Allowing traffic from anywhere
  target_tags = ["allow-https"]
}