variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t1.micro"
}

variable "region" {
  description = "Región de AWS"
  type        = string
  default     = "us-west-1"
}

variable "ami" {
  description = "ID de la Amazon Machine Image (AMI)"
  type        = string
  default     = "ami-04f7a54071e74f488" # Cambiar según la región
}

variable "environment" {
  description = "Entorno de despliegue"
  type        = string
  default     = "dev"

}
