
data "google_compute_image" "ubuntu_image" {
  family  = "ubuntu-1804-lts"
  project = "ubuntu-os-cloud"
}
