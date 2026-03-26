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


# NAT Gateway
# Security Group
# EICE Endpoint





# Secrets Manager 
variable "secret_name" {
  description = "Secrets Manager secret name"
  type        = string
}



# RDS 
variable "multi_az_deployment" {
  description = "Enable Multi-AZ deployment"
  type        = bool
}

variable "database_instance_identifier" {
  description = "RDS instance identifier"
  type        = string
}

variable "database_instance_class" {
  description = "RDS instance class (e.g., db.t3.micro)"
  type        = string
}

variable "database_engine" {
  description = "Database engine (mysql, postgres, mariadb)"
  type        = string
}

variable "database_engine_version" {
  description = "Database engine version (e.g., 8.0.39)"
  type        = string
}

variable "publicly_accessible" {
  description = "Make RDS publicly accessible"
  type        = bool
}


# IAM policy
# IAM role
# Instance profile for EC2 to assume role


# EC2
variable "amazon_linux_ami_id" {
  description = "Amazon Linux AMI ID"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type (e.g., t3.micro)"
  type        =  string
}

variable "flyway_version" {
  description = "Flyway CLI version"
  type        = string
}

variable "sql_script_s3_uri" {
  description = "S3 URI for SQL migration script"
  type        = string
}



# ACM 
variable "domain_name" {
  description = "Primary domain name"
  type        = string
}

variable "alternative_names" {
  description = "Alternative domain names (SANs)"
  type        = string
}



# ALB 
variable "target_type" {
  description = "Target type (ip, instance, lambda)"
  type        = string
}

variable "health_check_path" {
  description = "Health check path"
  type        = string
  default     = "/"
}




# SNS 
variable "operator_email" {
  description = "Email for SNS notifications"
  type        = string
}

# Route 53
variable "record_name" {
  description = "Route 53 record name"
  type        = string
}

# ASG
variable "web_files_s3_uri" {
  description = "S3 URI for application code"
  type        = string
}

variable "service_provider_file_s3_uri" {
  description = "S3 URI for service provider file"
  type        = string
}

variable "application_code_file_name" {
  description = "Application code file name"
  type        = string
}