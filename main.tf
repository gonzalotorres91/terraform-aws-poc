
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "poc_bucket" {
  bucket        = "mi-bucket-terraform-12345"
  force_destroy = true
}

