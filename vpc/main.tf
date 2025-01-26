provider "aws" {
    region = "ap-south-1"
}

resource "aws_route_table_association" "Terraform-RTA" {
  subnet_id      = aws_subnet.Terraform-subnet.id
  route_table_id = aws_route_table.terraform-rt.id
}

resource "aws_subnet" "Terraform-subnet" {
  vpc_id     = aws_vpc.Terraform-vpc.id
  #cidr_block = "10.0.1.0/24"
  cidr_block = var.subnet-cidr
  availability_zone = var.az
  map_public_ip_on_launch = "true"

  tags = {
    Name = "vpc-subnet"
  }
}

resource "aws_vpc" "Terraform-vpc" {
 # cidr_block       = "10.0.0.0/16"
  cidr_block = var.vpc-cidr-block
  tags = {
    Name = "VPC-TF"
  }
}



resource "aws_internet_gateway" "Terraform-Igw" {
  vpc_id = aws_vpc.Terraform-vpc.id

  tags = {
    Name = "Terraform-IGW"
  }
}

resource "aws_route_table" "terraform-rt" {
  vpc_id = aws_vpc.Terraform-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Terraform-Igw.id
  }

  tags = {
    Name = "TF-RT"
  }
}
