
# conect key 
resource "aws_key_pair" "nginx-server-ssh" {
  key_name   = "nginx-server-ssh"
  public_key = file("nginx-server.key.pub")

  tags = {
    Name        = "nginx-server-ssh"
    owner       = "Pablo"
    environment = var.environment
    team        = "DevOps"
    project     = "Terraform"
  }
}
