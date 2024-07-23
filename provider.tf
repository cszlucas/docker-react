terraform {
  backend "s3" {
    bucket = "elasticbeanstalk-us-east-1-654654204090"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.59.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}