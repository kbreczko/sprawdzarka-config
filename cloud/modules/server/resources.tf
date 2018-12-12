resource "google_compute_address" "public_ip" {
  name = "${var.server_name}-ip"
}

resource "google_compute_instance" "server" {
  name         = "${var.server_name}-server"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"

  boot_disk {
    initialize_params {
      image = "${data.google_compute_image.ubuntu_image.self_link}"
    }
  }

  network_interface {
     subnetwork = "${var.subnetwork_link}"

    access_config {
      nat_ip = "${google_compute_address.public_ip.address}"
    }
  }

  metadata {
    sshKeys = "${var.ssh_user}:${file(var.ssh_pub_key_file)}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get update",
      "sudo apt-get install -y docker.io"
    ]
    connection {
      type        = "ssh"
      user        = "${var.ssh_user}"
      private_key = "${file(var.ssh_pem_key_file)}"
    }
  }

  tags = ["${var.server_name}"]
}

resource "google_compute_firewall" "http_rule" {
  name    = "${var.server_name}-http-rule"
  network = "${var.network_link}"

  allow {
    protocol = "tcp"
    ports    = ["${var.port}"]
  }

  target_tags = ["${var.server_name}"]
}