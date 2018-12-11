output "subnetwork_link" {
  value = "${google_compute_subnetwork.http_servers.self_link}"
}

output "network_link" {
  value = "${google_compute_network.main_network.self_link}"
}