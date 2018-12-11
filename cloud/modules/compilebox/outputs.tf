output "server_public_ip" {
  value = "${google_compute_address.public_ip.address}"
}

output "server_name" {
  value = "${google_compute_instance.server.name}"
}