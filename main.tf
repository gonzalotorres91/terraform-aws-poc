
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "poc_bucket" {
  bucket        = "mi-bucket-terraform-prueba"
  force_destroy = true
}

