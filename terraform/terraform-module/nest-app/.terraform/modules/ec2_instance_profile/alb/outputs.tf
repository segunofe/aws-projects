# ALB 
output "alb_target_group_arn" {
  description = "The ARN of the ALB target group"
  value       = aws_lb_target_group.alb_target_group.arn
}

output "application_load_balancer_dns_name" {
  description = "The DNS name of the application load balancer"
  value       = aws_lb.application_load_balancer.dns_name
}

output "application_load_balancer_zone_id" {
  description = "The zone ID of the application load balancer"
  value       = aws_lb.application_load_balancer.zone_id
}