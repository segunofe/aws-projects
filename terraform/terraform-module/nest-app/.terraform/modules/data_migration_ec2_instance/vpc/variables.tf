# ──────────────────────────────────────────────
# General
# ──────────────────────────────────────────────
variable "region" {
  description = "AWS region where all resources will be provisioned."
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment name (e.g. dev, staging, prod). Used as a prefix/tag on all resources."
  type        = string
}

# ──────────────────────────────────────────────
# VPC
# ──────────────────────────────────────────────
variable "vpc_cidr" {
  description = "CIDR block for the VPC (e.g. 10.0.0.0/16)."
  type        = string
}

# ──────────────────────────────────────────────
# Public Subnets
# ──────────────────────────────────────────────
variable "public_subnet_az1_cidr" {
  description = "CIDR block for the public subnet in Availability Zone 1. Hosts resources that require direct internet access (e.g. load balancers, NAT gateways)."
  type        = string
}

variable "public_subnet_az2_cidr" {
  description = "CIDR block for the public subnet in Availability Zone 2. Provides high-availability for internet-facing resources."
  type        = string
}

# ──────────────────────────────────────────────
# Private Application Subnets
# ──────────────────────────────────────────────
variable "private_app_subnet_az1_cidr" {
  description = "CIDR block for the private application subnet in Availability Zone 1. Hosts application-tier resources (e.g. EC2, ECS tasks) with no direct inbound internet access."
  type        = string
}

variable "private_app_subnet_az2_cidr" {
  description = "CIDR block for the private application subnet in Availability Zone 2. Provides high-availability for the application tier."
  type        = string
}

# ──────────────────────────────────────────────
# Private Data Subnets
# ──────────────────────────────────────────────
variable "private_data_subnet_az1_cidr" {
  description = "CIDR block for the private data subnet in Availability Zone 1. Hosts data-tier resources (e.g. RDS, ElastiCache) isolated from the internet."
  type        = string
}

variable "private_data_subnet_az2_cidr" {
  description = "CIDR block for the private data subnet in Availability Zone 2. Provides high-availability for the data tier."
  type        = string
}
