terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = var.region
}

# Creating a Custom VPC
resource "aws_vpc" "custom_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "${var.env_prefix}-vpc"
  }

}

module "myapp_subnet" {
  source      = "./modules/subnet"
  env_prefix  = var.env_prefix
  vpc_id      = aws_vpc.custom_vpc.id
  web_subnet  = var.web_subnet
  subnet_zone = var.subnet_zone
}

module "myapp_webserver" {
  source        = "./modules/webserver"
  env_prefix    = var.env_prefix
  vpc_id        = aws_vpc.custom_vpc.id
  instance_type = var.instance_type
  web_subnet_id = module.myapp_subnet.web_subnet_id
  sg_ports      = var.sg_ports
  ssh_key_name  = var.ssh_key_name
}
