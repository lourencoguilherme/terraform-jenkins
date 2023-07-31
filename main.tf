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
