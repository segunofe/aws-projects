# EC2 Instance Connect Endpoint for private subnet SSH access
resource "aws_ec2_instance_connect_endpoint" "instance_connect_endpoint" {
  subnet_id          = var.private_app_subnet_az2_id
  security_group_ids = [var.eice_security_group_id]
  tags = {
    Name = "${var.environment}-${var.project_name}-eice"
  }
}

