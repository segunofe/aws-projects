# ECS 
output "ecs_service" {
  description = "The ECS service"
  value       = aws_ecs_service.ecs_service
}