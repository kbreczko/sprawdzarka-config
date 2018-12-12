variable "subnetwork_link" {
  description = "The URI of the created subnetwork."
}

variable "network_link" {
  description = "The URI of the created network."
}

variable "backend_ip" {
  description = "The URL of backend"
}

variable "ssh_user"{
  description = "Ssh user name"
}

variable "ssh_pub_key_file" {
  description = "The file with public key"
}

variable "ssh_pem_key_file" {
  description = "The file with private key"
}

variable "machine_type" {
  description = "Machine type"
}

variable "zone" {
  description = "The zone in which the instance should be started"
}

variable "port" {
  description = "The port on which the server will be shared"
}
