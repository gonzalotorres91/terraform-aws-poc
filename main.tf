terraform {
  required_version = ">= 1.3.0"

  cloud {
    organization = "devops-poc-org1"

    workspaces {
      name = "aws-poc"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "poc_bucket" {
  bucket        = "terraform-poc-${random_id.bucket_id.hex}"
  force_destroy = true
}

