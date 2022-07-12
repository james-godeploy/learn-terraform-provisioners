# Task 5 - Null Resource

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

module "security_group" {
    source = "../security-group"
}

resource "aws_instance" "task5-ec2" {
    ami = "ami-01cc34ab2709337aa"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
    vpc_security_group_ids = [module.security_group.sg-id]
    key_name = "LabKey"
}

resource "null_resource" "provisioner" {

}

output public_ip {
    description = "EC2 Public IP"
    value = aws_instance.task5-ec2.public_ip
}