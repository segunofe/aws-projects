# ACM 
variable "domain_name" {
  description = "Primary domain name"
  type        = string
}

variable "alternative_names" {
  description = "Alternative domain names (SANs)"
  type        = string
}