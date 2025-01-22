terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

provider "aws" {}

variable "portfolio_bucket_name" {
  type        = string
  default     = "portfolio-image-bucket"
  description = "AWS S3 portfolio bucket name"
}

resource "random_id" "portfolio_bucket_name_suffix" {
  byte_length = 8
}

resource "aws_s3_bucket" "private_bucket" {
  bucket = "${var.portfolio_bucket_name}-${random_id.bucket_name_suffix.hex}"
}

output "aws_s3_bucket_id" {
  description = "AWS S3 portfolio bucket id"
  value       = aws_s3_bucket.private_bucket.id
}

output "aws_s3_bucket_name" {
  description = "AWS S3 portfolio bucket name"
  value       = aws_s3_bucket.private_bucket.bucket
}

output "aws_s3_bucket_name_suffix" {
  value       = random_id.bucket_name_suffix.hex
  description = "AWS S3 portfolio bucket name suffix"
}
