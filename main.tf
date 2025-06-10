terraform {
  required_version = ">= 1.3.0"

  cloud {
    organization = "devops-poc-org1"

    workspaces {
      name = "aws-poc"
    }
  }
}

variable "aws_access_key" {
  type      = string
  sensitive = true
}

variable "aws_secret_key" {
  type      = string
  sensitive = true
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "poc_bucket" {
  bucket        = "terraform-poc-${random_id.bucket_id.hex}"
  force_destroy = true
}

