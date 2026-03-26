# Security Groups 
output "eice_security_group_id" {
  description = "The ID of the EICE security group"
  value       = aws_security_group.eice_security_group.id
}

output "alb_security_group_id" {
  description = "The ID of the ALB security group"
  value       = aws_security_group.alb_security_group.id
}

output "app_server_security_group_id" {
  description = "The ID of the app server security group"
  value       = aws_security_group.app_server_security_group.id
}

output "db_migrate_server_security_group_id" {
  description = "The ID of the database migrate server security group"
  value       = aws_security_group.db_migrate_server_security_group.id
}

output "database_security_group_id" {
  description = "The ID of the database security group"
  value       = aws_security_group.database_security_group.id
}