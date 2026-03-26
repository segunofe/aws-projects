# ALB 
variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "alb_security_group_id" {
  description = "The ID of the ALB security group"
  type        = string
}

variable "public_subnet_az1_id" {
  description = "The ID of public subnet in AZ1"
  type        = string
}

variable "public_subnet_az2_id" {
  description = "The ID of public subnet in AZ2"
  type        = string
}

variable "target_type" {
  description = "Target type (ip, instance, lambda)"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "health_check_path" {
  description = "Health check path"
  type        = string
  default     = "/"
}

variable "certificate_arn" {
  description = "The ARN of the ACM certificate"
  type        = string
}