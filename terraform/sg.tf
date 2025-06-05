# firewall
resource "aws_security_group" "nginx-server-sg" {
  name        = "nginx-server-sg"
  description = "Secrity group allowitn HTTP and SSH access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # permite el acceso desde cualquier IP
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # permite el acceso desde cualquier IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 significa todos los protocolos
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "nginx-server-sg"
    owner       = "Pablo"
    environment = var.environment
    team        = "DevOps"
    project     = "Terraform"
  }
}
