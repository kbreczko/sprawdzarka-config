resource "google_sql_database_instance" "main_db" {
  name = "main-db"
  database_version = "MYSQL_5_6"
  region = "${var.region}"

  settings {
    tier = "db-f1-micro"
    disk_autoresize = "true"

    ip_configuration = {
      ipv4_enabled = true

      authorized_networks = [
        {
          name = "${var.server_name}"
          value = "${var.server_public_ip}/32"
        },
      ]
    }
  }
}

resource "google_sql_database" "database" {
  instance = "${google_sql_database_instance.main_db.name}"
  name = "app_db"
}

resource "google_sql_user" "user" {
  instance = "${google_sql_database_instance.main_db.name}"
  name = "root"
  password = "root"
}

