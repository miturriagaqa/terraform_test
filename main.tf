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
}

output "instance_name" {
  value     = aws_instance.app_server.tags.Name
}

output "app_server_instance_type" {
  value     = aws_instance.app_server.instance_type
}


# Output hardcoded values
output "message" {
  value = "Hello, US FRAMEWORK TEAM!"
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

