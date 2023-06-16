terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 0.13"
}

provider "aws" {
  region  = "us-east-2"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "app_server"{
  ami           = "ami-0b301ce3ce347599c"
  instance_type = "t2.micro"
  
  tags = {
    Name = var.instance_name
  }
}

output "app_server_ami_id" {
  value     = aws_instance.app_server.ami
  sensitive = true
}

# Output hardcoded values
output "message" {
  value = "Hello, Terraform!"
}

output "number" {
  value = 42
}

output "list" {
  value = ["apple", "banana", "cherry"]
}

output "map" {
  value = {
    key1 = "value1"
    key2 = "value2"
  }
}
