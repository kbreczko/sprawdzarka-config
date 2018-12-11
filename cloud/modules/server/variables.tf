variable "subnetwork_link" {
  description = "The URI of the created subnetwork."
}

variable "network_link" {
  description = "The URI of the created network."
}

variable "server_name" {
  description = "Server name"
}

variable "port" {
  description = "The port on which the server will be shared"
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

