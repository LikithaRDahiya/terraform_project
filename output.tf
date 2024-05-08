output "app_server_public_ip" {
  value = aws_instance.app_server.public_ip
}

output "db_server_public_ip" {
  value = aws_instance.db_server.public_ip
}

output "mysql_endpoint" {
  value = aws_instance.db_server.private_ip  # You might need to adjust this based on your MySQL setup
}

output "app_server_public_dns" {
  value = aws_instance.app_server.public_dns
}
