# Environment
output "region" {
  description = "AWS region"
  value       = var.region
}

output "project_name" {
  description = "Project name"
  value       = var.project_name
}

output "environment" {
  description = "Environment (dev, staging, prod)"
  value       = var.environment
}

# VPC
output "vpc_cidr" {
  description = "VPC CIDR block"
  value       = var.vpc_cidr
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc.id
}

output "internet_gateway" {
  description = "The Internet Gateway"
  value       = aws_internet_gateway.internet_gateway
}

output "public_subnet_az1_id" {
  description = "The ID of public subnet in AZ1"
  value       = aws_subnet.public_subnet_az1.id
}

output "public_subnet_az2_id" {
  description = "The ID of public subnet in AZ2"
  value       = aws_subnet.public_subnet_az2.id
}

output "private_app_subnet_az1_id" {
  description = "The ID of private app subnet in AZ1"
  value       = aws_subnet.private_app_subnet_az1.id
}

output "private_app_subnet_az2_id" {
  description = "The ID of private app subnet in AZ2"
  value       = aws_subnet.private_app_subnet_az2.id
}

output "private_data_subnet_az1_id" {
  description = "The ID of private data subnet in AZ1"
  value       = aws_subnet.private_data_subnet_az1.id
}

output "private_data_subnet_az2_id" {
  description = "The ID of private data subnet in AZ2"
  value       = aws_subnet.private_data_subnet_az2.id
}

output "availability_zone_1" {
  description = "The first availability zone in the region (e.g. us-east-1a)"
  value       = data.aws_availability_zones.availability_zones.names[0]
}

output "availability_zone_2" {
  description = "The second availability zone in the region (e.g. us-east-1b)"
  value       = data.aws_availability_zones.availability_zones.names[1]
}