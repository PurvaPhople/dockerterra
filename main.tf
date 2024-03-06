terraform {
  required_version = "~> 1.1"
  required_providers {
    aws = {
      version = "~>3.27"
    }
  }
}
provider "aws" {
  region     = var.region_name
  access_key = var.access_key
  secret_key = var.secret_key
}
 
resource "aws_instance" "yourec2" {
  ami                    = "ami-0ba259e664698cbfc"
  instance_type          = lookup(var.instance_type,terraform.workspace)
  tags = {
    Name = "terraform-inst"
  }
}

 variable "access_key"{}
 variable "secret_key"{}
 variable "region_name"
   default = "ap-south-1"
}
