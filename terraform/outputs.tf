
# Output the public IP of the instance
output "nginx_server_public_ip" {
  value       = aws_instance.nginx-server.public_ip
  description = "Public IP of the Nginx server instance"
}

# Output the public DNS of the instance
output "nginx_server_public_dns" {
  value       = aws_instance.nginx-server.public_dns
  description = "Public DNS of the Nginx server instance"
}


