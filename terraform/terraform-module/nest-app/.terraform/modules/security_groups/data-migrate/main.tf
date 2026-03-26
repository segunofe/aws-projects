# EC2 instance for database migration
resource "aws_instance" "data_migrate_ec2" {
  ami                    = var.amazon_linux_ami_id
  instance_type          = var.ec2_instance_type
  subnet_id              = var.private_app_subnet_az1_id
  vpc_security_group_ids = [var.db_migrate_server_security_group_id]
  iam_instance_profile   = var.ec2_instance_profile_role_name

  user_data_base64 = base64encode(templatefile("${path.module}/db-migrate-script.sh.tpl", {
    FLYWAY_VERSION    = var.flyway_version
    SQL_SCRIPT_S3_URI = var.sql_script_s3_uri
    RDS_ENDPOINT      = var.rds_endpoint
    RDS_DB_NAME       = var.rds_db_name
    RDS_DB_USERNAME   = var.rds_db_username
    RDS_DB_PASSWORD   = var.rds_db_password
  }))

  tags = {
    Name = "${var.environment}-${var.project_name}-db-migrate"
  }
}