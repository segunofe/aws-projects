# ACM certificate output (if importing an existing certificate)
output "certificate_arn" {
  description = "The ARN of the ACM certificate"
  value       = data.aws_acm_certificate.existing.arn
}

# ACM certificate output (if creating a new certificate)

# output "certificate_arn" {
#   description = "The ARN of the ACM certificate"
#   value       = aws_acm_certificate.acm_certificate.arn
# }

output "domain_name" {
  description = "The domain name"
  value       = var.domain_name
}