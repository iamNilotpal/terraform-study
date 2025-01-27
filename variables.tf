variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
}

variable "portfolio_bucket_name" {
  type        = string
  default     = "portfolio-image-bucket"
  description = "AWS S3 portfolio bucket name"
}
