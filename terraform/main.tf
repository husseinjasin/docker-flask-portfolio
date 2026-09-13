terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}



resource "aws_s3_bucket" "portfolio_bucket" {
    bucket = "docker-flask-portfolio-demo-hussein"
    tags = {
      Environment = "learning"
}
}