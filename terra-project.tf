provider "aws" {
 # access_key = ""
 # secret_key = ""
  region     = "ap-south-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


# Create a VPC
resource "aws_vpc" "vpc-aws-three-tier-wokshop" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-aws-three-tier-workshop"
  }
}

# Create Public subnet in az1
resource "aws_subnet" "public_web_subnet_az-1-a" {
  vpc_id        = "aws_vpc.vpc-aws-three-tier-workshop"
  cidr_block    = "10.0.0.0/24"
  availability_zone = "ap-south-1a"
  tags  = {
    Name = "public-web-subnet-az-1-a"
  }
}

# Create Public subnet in az2
resource "aws_subnet" "public_web_subnet_az-2-b" {
  vpc_id        = "aws_vpc.vpc-aws-three-tier-workshop"
  cidr_block    = "10.0.1.0/24"
  availability_zone = "ap-south-1b"
  tags  = {
    Name = "public-web-subnet-az-2-b"
  }
}

# Create Private subnet in az1
resource "aws_subnet" "Private-App-subnet-az-1-a" {
  vpc_id        = "aws_vpc.vpc-aws-three-tier-workshop"
  cidr_block    = "10.0.2.0/24"
  availability_zone = "ap-south-1a"
  tags  = {
    Name = "Private-App-subnet-az-1-a"
  }
}

# Create Private subnet in az2
resource "aws_subnet" "Private-App-subnet-az-2-b" {
  vpc_id        = "aws_vpc.vpc-aws-three-tier-workshop"
  cidr_block    = "10.0.3.0/24"
  availability_zone = "ap-south-1b"
  tags  = {
    Name = "Private-App-subnet-az-2-b"
  }
}

# Create DB subnet in az1
resource "aws_subnet" "DB-subnet-az-1-a" {
  vpc_id        = "aws_vpc.vpc-aws-three-tier-workshop"
  cidr_block    = "10.0.5.0/24"
  availability_zone = "ap-south-1a"
  tags  = {
    Name = "DB-subnet-az-1-a"
  }
}

# Create DB subnet in az2
resource "aws_subnet" "DB-subnet-az-2-b" {
  vpc_id        = "aws_vpc.vpc-aws-three-tier-workshop"
  cidr_block    = "10.0.5.0/24"
  availability_zone = "ap-south-1b"
  tags  = {
    Name = "DB-subnet-az-2-b"
  }
}

#Create Internet Gateway
resource "aws_internet_gateway" "three-tier-igw" {
  vpc_id = aws_vpc.vpc-aws-three-tier-wokshop
}

# #Create NAT Gateway
# resource "aws_gateway" "NAT-GW-AZ1"
#   allocation_id = aws_eip.
#   subnet_id = "aws_subnet.public-web-subnet-az-1-a"
#   tags = {
#     Name = "AT-GW-AZ1"
#   }