provider "aws" {
  region = var.region # cambiar esta
  # colocar la key y la secret key
  access_key = var.access_key
  secret_key = var.secret_key
}
