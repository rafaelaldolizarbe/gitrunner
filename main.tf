
# Configuração de AWS Provider

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" {
  region = "us-east-1"
}

#Configuração de VPC

resource "aws_vpc" "vpc-tf" {
  cidr_block       = "10.0.0.0/24"
  instance_tenancy = "default"

  tags = {
    Name = "vpc-easy_find"
  }
}

#Subnets
resource "aws_subnet" "subnet-public" {
  vpc_id     = aws_vpc.vpc-tf.id
  cidr_block = "10.0.0.0/25"

  tags = {
    Name = "subnet-public"
  }
}




