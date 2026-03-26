# RDS
variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "private_data_subnet_az1_id" {
  description = "The ID of private data subnet in AZ1"
  type        = string
}

variable "private_data_subnet_az2_id" {
  description = "The ID of private data subnet in AZ2"
  type        = string
}

variable "database_engine" {
  description = "Database engine (mysql, postgres, mariadb)"
  type        = string
}

variable "multi_az_deployment" {
  description = "Enable Multi-AZ deployment"
  type        = bool
}

variable "database_instance_class" {
  description = "RDS instance class (e.g., db.t3.micro)"
  type        = string
}

variable "rds_db_username" {
  description = "The RDS database username"
  type        = string
}

variable "rds_db_password" {
  description = "The RDS database password"
  type        = string
  sensitive   = true
}

variable "rds_db_name" {
  description = "The RDS database name"
  type        = string
}

variable "database_security_group_id" {
  description = "The ID of the database security group"
  type        = string
}

variable "availability_zone_1" {
  description = "The first availability zone"
  type        = string
}

variable "publicly_accessible" {
  description = "Make RDS publicly accessible"
  type        = bool
}