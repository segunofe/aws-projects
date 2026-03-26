# RDS 
output "rds_endpoint" {
  description = "The RDS database endpoint"
  value       = aws_db_instance.database_instance.endpoint
}