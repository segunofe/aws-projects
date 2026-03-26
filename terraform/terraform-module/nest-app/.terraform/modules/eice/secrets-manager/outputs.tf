# Secrets Manager 
output "rds_db_username" {
  description = "The RDS database username"
  value       = local.secrets.username
}

output "rds_db_password" {
  description = "The RDS database password"
  value       = local.secrets.password
}

output "rds_db_name" {
  description = "The RDS database name"
  value       = local.secrets.dbname
}