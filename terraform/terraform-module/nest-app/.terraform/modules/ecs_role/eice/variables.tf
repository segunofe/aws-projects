# EC2 Instance Connect Endpoint
variable "private_app_subnet_az2_id" {
  description = "The ID of private app subnet in AZ2"
  type        = string
}

variable "eice_security_group_id" {
  description = "The ID of the EICE security group"
  type        = string
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}
