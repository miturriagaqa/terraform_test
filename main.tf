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

resource "aws_key_pair" "deployer" {
  key_name = var.key_name
}

resource "aws_instance" "app_server" "deployer"{
  ami           = "ami-0b301ce3ce347599c"
  instance_type = "t2.micro"
  key_name = aws_key_pair.deployer.key_name
  
  tags = {
    Name = "MishAwsTfInstance"
  }
}
