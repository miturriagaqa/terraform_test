terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.3"
}

provider "aws" {
  region  = "us-east-2"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "app_server" {
  ami           = "ami-0b301ce3ce347599c"
  instance_type = "t2.micro"

  tags = {
    Name = "MishAwsTfInstance"
  }
}
