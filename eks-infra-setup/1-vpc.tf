resource "aws_vpc" "vpc-main-eks" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "vpc-main-eks"
  }
}