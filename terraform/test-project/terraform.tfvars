# ──────────────────────────────────────────────
# General
# ──────────────────────────────────────────────
region        = "us-east-2"
project_name  = "nest"
environment   = "dev"

# ──────────────────────────────────────────────
# VPC
# ──────────────────────────────────────────────
vpc_cidr = "10.1.0.0/16"

# ──────────────────────────────────────────────
# Public Subnets
# ──────────────────────────────────────────────
public_subnet_az1_cidr = "10.1.0.0/24"
public_subnet_az2_cidr = "10.1.1.0/24"

# ──────────────────────────────────────────────
# Private Application Subnets
# ──────────────────────────────────────────────
private_app_subnet_az1_cidr = "10.1.2.0/24"
private_app_subnet_az2_cidr = "10.1.3.0/24"

# ──────────────────────────────────────────────
# Private Data Subnets
# ──────────────────────────────────────────────
private_data_subnet_az1_cidr = "10.1.4.0/24"
private_data_subnet_az2_cidr = "10.1.5.0/24"

# ──────────────────────────────────────────────
# Secrets Manager   
secret_name = "dev-app-secrets"

# ──────────────────────────────────────────────
# RDS
# ──────────────────────────────────────────────

multi_az_deployment          = false
database_instance_identifier = "app-db"
database_instance_class      = "db.t3.micro"
database_engine              = "mysql"
database_engine_version      = "8.0.43"
publicly_accessible          = false


# ──────────────────────────────────────────────
# EC2
# ──────────────────────────────────────────────
amazon_linux_ami_id = "ami-09256c524fab91d36"
ec2_instance_type   = "t3.medium"
flyway_version      = "11.19.1"
sql_script_s3_uri   = "s3://dev-so-app-webfiles/project-3-assets/V1__nest.sql"


# ──────────────────────────────────────────────
# ACM
# ──────────────────────────────────────────────

domain_name       = "segunofe.com"
alternative_names = "*.segunofe.com"


# ALB
target_type       = "instance"
health_check_path = "/index.php"




# SNS
operator_email = "ofesegunayodeji@gmail.com"

# Route 53
record_name = "www"

# ASG
web_files_s3_uri             = "s3://dev-so-app-webfiles/project-3-assets/nest.zip"
service_provider_file_s3_uri = "s3://dev-so-app-webfiles/project-3-assets/AppServiceProvider.php"
application_code_file_name   = "nest"