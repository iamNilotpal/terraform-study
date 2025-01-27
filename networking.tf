resource "random_id" "vpc_id_suffix" {
  byte_length = 8
}

resource "aws_vpc" "tf_managed_vpc" {
  cidr_block = "10.0.0.0/24"
  tags = merge(local.common_tags, {
    Name = "terraform-managed-vpc-${random_id.vpc_id_suffix.hex}"
  })
}

resource "aws_subnet" "tf_managed_public_subnet" {
  vpc_id     = aws_vpc.tf_managed_vpc.id
  cidr_block = "10.0.0.0/24"
}

output "aws_vpc_arn" {
  value       = aws_vpc.tf_managed_vpc.arn
  description = "AWS Terraform managed VPC ARN"
}
