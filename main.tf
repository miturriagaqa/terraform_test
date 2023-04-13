terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 0.13.5"
}

provider "aws" {
  region  = "us-east-2"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_key_pair" "example_key_pair" {
  key_name   = "mish_key_pair"
  public_key = "MIIEpAIBAAKCAQEA6MdoLKuRnmgd0ZpWk53KYHUL8vGf7B36MfeuXja6eYnHqFX2yft1canmwaMl4TlgisSeh/qTLR2lGIa4C0SFtyyaC1+ZA2vBnQBAe5g+e6hjNFlVL2Sxioy6HT9EQE8458qYbvYvntWq33O917RZ+aP91NcH6VXtaIyumFBUMlDDMDwZNi1LrKB3uf5FcNDeRfHm9b5rmXdm/Hp829CJ1i2pl4mn9vpp2809J3YSdQdjiQPOO7npSA+QSPYNqVwt/++Bs5H1Uf1BaomcI7SxQsUDldStcwlywYQveBgcBjiLgrnwRzAt17Cq0BJDlTsMBE+NJ/7dpURDKfNFc9nF8wIDAQABAoIBAEvzG/tPM2Dy6Z/E8rCRUEGujuqCicJZeZOqE3tr8eXL3ZgADFiUshoW7FKLr8VPmj9MrckCKdkTjhV1h0Et507/v3cshtlF5FMcjO2GnARuyYeACjo/aWoiRmtahCNTdeazBI9XxevWHT1xHyTtFFpOdnhmfI9WWPK+zAyoUQBlGBh3la4oq/FYKOKmDEp05p/pNsUxvAvqiiBElJrSj5pK/NXODKV6YY/HGZ/zPivE8qSjgn8ZGk+xRuU/oyip6NP1VW9HcalFzm3nlb1WSmIvsIhkdGvzzElIVzb+lsp/pLLutchOEZlD+48975anMiPpZrNJYwaFqcFZvn3vnZECgYEA/DViGyppw+UDjd7yz+6zx8QtFDnLP/s21Ux2JB65WZcRUYH+iOoI7CuRtGKrjw3NtLeuY8AP+GTqm7/SgrXL3+Td6xEqAKFJFZAwov8yogn1nr5IlM9cLgGk0SHeVagosiYWd4HuqiwZ/HmskR2DNtHRVfKsmGhNzLjX7u5QDesCgYEA7Ec/35eIvvunkOGO8xoPwxA9NOy34auna89gIGGJqS3Bi8IikDRtVIa9wBE/JPFn/HMu2iPLEBzwUZa4h/FcKR0Ky6bQMqY/HIUkScOLoOevpa6aTCN6BmXPiQ+zQjTAvCGKC98ziDQlz1R5zOUiSptKYYiTEmTDBu7qeDocvhkCgYBCSp3Q2iMWtHlsru9PrERg+7WFnXNJC/Trt79N2y2I2OZacDrBLhLOUN1pdo31egFZwPX7jh4kghIQgikI5lQCM5wJD2fk5n/ZRR8jmMRsRwXihc16H87w4Mm7lpVkGmEoAk7hdquO2yyxaiHrusAkhp3pY3HuVWwtpWBMkyNDpQKBgQCVYW52lD12UXBdXt2bwMxaTPgFb+vJl1bgCFoD3ubDuRP2oiRr+1lr6UwqFD1Rw/Y0WzYx4BNP+pvNWXcNK4FS1POwUaSrgQPBqkOJB0JN1mzsWPlgTcWmKdQOGYkBwIxh5Op8Gv9fi2ikLgpbijol5QwfodMp+955ka9Xl5X4cQKBgQDITN0GQ4oA/Jd9R2AZnXSKdKNNxqxFZnzZXIfA2MHenFWZApKJdCQj265fTxvGrXbY7VlG5S8cC8ZWTlmahvvJ0GjFj9eZW5xr9HlO8rYUNXbFB2TJ14KGTamCWwhUOuK8w4Bh8fRW/DagQBrhXLqGAw94Bh+kEhaxQe/PKA6FXQ=="

}

resource "aws_instance" "app_server"{
  ami           = "ami-0b301ce3ce347599c"
  instance_type = "t2.micro"
  
  tags = {
    Name = "MishAwsTfInstance"
  }
  key_name = aws_key_pair.example_key_pair.key_name
}
