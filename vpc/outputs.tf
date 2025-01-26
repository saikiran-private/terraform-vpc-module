output "vpc-id" {
  value = aws_vpc.Terraform-vpc.id
}

output "subnet-id" {
  value = aws_subnet.Terraform-subnet.id 
}
