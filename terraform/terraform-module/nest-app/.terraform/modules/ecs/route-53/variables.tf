# Route 53 
variable "domain_name" {
  description = "The domain name"
  type        = string
}

variable "record_name" {
  description = "The Route 53 record name"
  type        = string
}

variable "application_load_balancer_dns_name" {
  description = "The DNS name of the application load balancer"
  type        = string
}

variable "application_load_balancer_zone_id" {
  description = "The zone ID of the application load balancer"
  type        = string
}