# EC2 instance profile
output "ec2_instance_profile_role_name" {
  description = "The name of the EC2 instance profile"
  value       = aws_iam_instance_profile.s3_full_access_instance_profile.name
}