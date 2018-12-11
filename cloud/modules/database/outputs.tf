output "database_ip" {
  value = "${google_sql_database_instance.main_db.ip_address}"
}