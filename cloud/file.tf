provider "google" {
  project = "sprawdzarka-225120"
  region = "europe-west3"
}

# export GOOGLE_APPLICATION_CREDENTIALS=/path/to/credentials/file.json

# ------------------------------------ module ---------------------------------
module "database" {
  source = "./modules/database/"
  server_public_ip = "${module.backend.server_public_ip}"
  server_name = "${module.backend.server_name}"
  region="europe-west3"
}

module "network" {
  source = "./modules/network/"
}

module "backend" {
  source = "modules/server/"
  subnetwork_link = "${module.network.subnetwork_link}"
  network_link = "${module.network.network_link}"
  server_name = "backend"
  port = "8081"
  ssh_user = "kamil"
  ssh_pub_key_file = "/home/kamil/Konfiguracje/kamil.pub"
  ssh_pem_key_file = "/home/kamil/Konfiguracje/kamil.pem"
  zone="europe-west3-a"
  machine_type="n1-standard-1"
}

module "frontend" {
  source = "modules/server/"
  subnetwork_link = "${module.network.subnetwork_link}"
  network_link = "${module.network.network_link}"
  server_name = "frontend"
  port = "80"
  ssh_user = "kamil"
  ssh_pub_key_file = "/home/kamil/Konfiguracje/kamil.pub"
  ssh_pem_key_file = "/home/kamil/Konfiguracje/kamil.pem"
  zone="europe-west3-a"
  machine_type="n1-standard-1"
}

module "compilebox" {
  source = "modules/compilebox/"
  subnetwork_link = "${module.network.subnetwork_link}"
  network_link = "${module.network.network_link}"
  backend_ip = "${module.backend.server_public_ip}"
  ssh_user = "kamil"
  ssh_pub_key_file = "/home/kamil/Konfiguracje/kamil.pub"
  ssh_pem_key_file = "/home/kamil/Konfiguracje/kamil.pem"
  port = "8080"
  zone="europe-west3-a"
  machine_type="n1-standard-1"
}

# ------------------------------------ output ---------------------------------

output "backend_ip_address" {
  value = "${module.backend.server_public_ip}"
}

output "frontend_ip_address" {
  value = "${module.frontend.server_public_ip}"
}

output "compilebox_ip_address" {
  value = "${module.compilebox.server_public_ip}"
}

output "database_ip_address" {
  value = "${module.database.database_ip}"
}