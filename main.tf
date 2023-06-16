terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 0.13"
}

data "aws_key_pair" "existing_keypair" {
  key_name = "mish_key_pair"
}

provider "aws" {
  region  = "us-east-2"
}

resource "aws_instance" "app_server"{
  ami           = "ami-0b301ce3ce347599c"
  instance_type = "t2.micro"
  key_name = data.aws_key_pair.existing_keypair.key_name
  
  tags = {
    Name = var.instance_name
  }
    user_data = <<EOF
#!/bin/bash
yum update -y
yum install -y httpd
echo "Hello World" > /var/www/html/index.html
systemctl start httpd
systemctl enable httpd
EOF
}
