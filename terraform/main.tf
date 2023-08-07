terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.9.0"
    }
  }
  backend "s3" {
    bucket = "live-jenkins"
    key    = "terraform-jenkins.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}

module "jenkins" {
  source = "./jenkins"
  region = var.region
  environment = var.environment
  vpc_cidr = var.vpc_cidr
  public_subnet_1_cidr  = var.public_subnet_1_cidr
  public_subnet_2_cidr  = var.public_subnet_2_cidr
  public_subnet_3_cidr  = var.public_subnet_3_cidr
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr
  private_subnet_3_cidr = var.private_subnet_3_cidr
  instance_type = var.instance_type
  instance_ami = var.instance_ubuntu_ami
  keyname = var.keyname
}