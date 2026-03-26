# EC2 instance for database migration
variable "amazon_linux_ami_id" {
  description = "Amazon Linux AMI ID"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type (e.g., t3.micro)"
  type        = string
}

variable "private_app_subnet_az1_id" {
  description = "The ID of private app subnet in AZ1"
  type        = string
}

variable "db_migrate_server_security_group_id" {
  description = "The ID of the database migrate server security group"
  type        = string
}

variable "ec2_instance_profile_role_name" {
  description = "The name of the EC2 instance profile"
  type        = string
}

variable "flyway_version" {
  description = "Flyway CLI version"
  type        = string
}

variable "sql_script_s3_uri" {
  description = "S3 URI for SQL migration script"
  type        = string
}

variable "rds_endpoint" {
  description = "The RDS database endpoint"
  type        = string
}

variable "rds_db_name" {
  description = "The RDS database name"
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

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}