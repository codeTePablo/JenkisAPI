
resource "aws_instance" "nginx-server" {
  ami           = var.ami # amazon machine imagen (como ubuntu)
  instance_type = var.instance_type

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y nginx
              sudo systemctl enable nginx
              sudo systemctl start nginx
              EOF

  key_name = aws_key_pair.nginx-server-ssh.key_name # conecta la key creada

  vpc_security_group_ids = [aws_security_group.nginx-server-sg.id] # conecta el grupo de seguridad creado

  tags = {
    Name        = "nginx-server"
    owner       = "Pablo"
    environment = var.environment
    team        = "DevOps"
    project     = "Terraform"
  }
}
