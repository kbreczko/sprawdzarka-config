resource "google_compute_network" "main_network" {
  name                    = "main-network"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "http_servers" {
  name          = "http-servers"
  ip_cidr_range = "10.128.0.0/21"
  network       = "${google_compute_network.main_network.self_link}"
}

resource "google_compute_firewall" "ssh_rule" {
  name    = "ssh-rule"
  network = "${google_compute_network.main_network.self_link}"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}
