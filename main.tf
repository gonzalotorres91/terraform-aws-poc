

  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "us-east-1"  # Cambia a tu región si es necesario
}

resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "poc_bucket" {
  bucket        = "mi-bucket-poc-${random_id.bucket_id.hex}"
  force_destroy = true

  tags = {
    Name        = "poc-bucket"
    Environment = "Dev"
  }
}
