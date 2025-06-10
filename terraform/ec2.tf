
resource "aws_instance" "nginx-server" {
  ami           = var.ami # amazon machine imagen (como ubuntu)
  instance_type = var.instance_type

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y docker.io git
              systemctl start docker
              systemctl enable docker

              # Clona el repositorio
              git clone https://github.com/codeTePablo/JenkisAPI.git /app

              # Construye y corre el contenedor
              cd /app
              docker build -t mi-api .
              docker run -d -p 5000:5000 --name contenedor-api mi-api
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
