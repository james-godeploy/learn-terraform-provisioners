# Task 2 - Local-Exec Provisioners

terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 4.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "local-exec" {
    ami = "ami-01cc34ab2709337aa"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
}