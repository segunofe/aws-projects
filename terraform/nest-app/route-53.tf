# DNS record pointing to ALB
resource "aws_route53_record" "site_domain" {
  zone_id = data.aws_route53_zone.hosted_zone.id
  name    = var.record_name
  type    = "A"

  alias {
    name                   = aws_lb.application_load_balancer.dns_name
    zone_id                = data.aws_route53_zone.hosted_zone.id
    evaluate_target_health = true
  }
}

# Create for NameCheap 
