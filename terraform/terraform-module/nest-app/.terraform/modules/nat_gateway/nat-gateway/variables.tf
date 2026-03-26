
variable "environment" {
  description = "Deployment environment name (e.g. dev, staging, prod). Used as a prefix/tag on all resources."
  type        = string
}



# ──────────────────────────────────────────────
# Public Subnet id
# ──────────────────────────────────────────────
variable "public_subnet_az1_id" {
  description = "The ID of the public subnet in Availability Zone 1. Hosts resources that require direct internet access (e.g. load balancers, NAT gateways)."
  type        = string
}



variable "internet_gateway" {
  description = "The Internet Gateway"
  type        = any
}


variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}
# ──────────────────────────────────────────────
# Private Application Subnets
# ──────────────────────────────────────────────
variable "private_app_subnet_az1_id" {
  description = "The ID of the private application subnet in Availability Zone 1. Hosts application-tier resources (e.g. EC2, ECS tasks) with no direct inbound internet access."
  type        = string
}

variable "private_app_subnet_az2_id" {
  description = "The ID of the private application subnet in Availability Zone 2. Provides high-availability for the application tier."
  type        = string
}

# ──────────────────────────────────────────────
# Private Data Subnets
# ──────────────────────────────────────────────
variable "private_data_subnet_az1_id" {
  description = "The ID of the private data subnet in Availability Zone 1. Hosts data-tier resources (e.g. RDS, ElastiCache) isolated from the internet."
  type        = string
}

variable "private_data_subnet_az2_id" {
  description = "The ID of the private data subnet in Availability Zone 2. Provides high-availability for the data tier."
  type        = string
}
