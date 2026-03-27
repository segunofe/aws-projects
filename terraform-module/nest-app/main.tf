# Create VPC
module "vpc" { # the "vpc" is the name i choose to give to the module, it can be any name
  source = "git::ssh://git@github.com/segunofe/modules.git//vpc"

  # Note that what are below are the variables and their corresponding values that the vpc module expects.
  # For reference, check the variables.tf file in the vpc module 
  region                       = "us-east-2"
  project_name                 = "nest"
  environment                  = "dev"
  vpc_cidr                     = "10.0.0.0/16"
  public_subnet_az1_cidr       = "10.0.0.0/24"
  public_subnet_az2_cidr       = "10.0.1.0/24"
  private_app_subnet_az1_cidr  = "10.0.2.0/24"
  private_app_subnet_az2_cidr  = "10.0.3.0/24"
  private_data_subnet_az1_cidr = "10.0.4.0/24"
  private_data_subnet_az2_cidr = "10.0.5.0/24"

}

# Create Nat Gateway
module "nat_gateway" {
  source = "git::ssh://git@github.com/segunofe/modules.git//nat-gateway"

  # Note: The below lines are the variables and their corresponding values that the nat-gateway module expects.
  # For reference, check the variables.tf file in the nat-gateway module 
  # We are passing the values from the vpc module outputs instead of hardcoding them here. 
  # This way, we can reuse the values across different modules and avoid duplication.  
  environment                = module.vpc.environment # instead of hardcoding the environment, we can reference it from the vpc module
  public_subnet_az1_id       = module.vpc.public_subnet_az1_id
  internet_gateway           = module.vpc.internet_gateway
  vpc_id                     = module.vpc.vpc_id
  private_app_subnet_az1_id  = module.vpc.private_app_subnet_az1_id
  private_app_subnet_az2_id  = module.vpc.private_app_subnet_az2_id
  private_data_subnet_az1_id = module.vpc.private_data_subnet_az1_id
  private_data_subnet_az2_id = module.vpc.private_data_subnet_az2_id
}


# Create Security Groups 
module "security_groups" {
  source = "git::ssh://git@github.com/segunofe/modules.git//security-groups"

  # Note: The below lines are the variables and their corresponding values that the security-groups module expects
  # for the creation of the security groups.
  # For reference, check the variables.tf file in the security-groups module 
  # We are passing the values from the vpc module outputs instead of hardcoding them here. 
  # This way, we can reuse the values across different modules and avoid duplication. 

  environment  = module.vpc.environment
  project_name = module.vpc.project_name
  vpc_id       = module.vpc.vpc_id # this line is saying to get the value of the vpc_id, go the vpc module and get the output value of vpc_id.
  vpc_cidr     = module.vpc.vpc_cidr
}

# Create EC2 Instance Connect Endpoint
module "eice" {
  source = "git::ssh://git@github.com/segunofe/modules.git//eice"


  private_app_subnet_az2_id = module.vpc.private_app_subnet_az2_id
  eice_security_group_id    = module.security_groups.eice_security_group_id
  environment               = module.vpc.environment
  project_name              = module.vpc.project_name
}

# Get secrets from Secrets Manager
module "secrets_manager" {
  source = "git::ssh://git@github.com/segunofe/modules.git//secrets-manager"

  secret_name = "dev-app-secrets"
}


# Create RDS instance
module "rds" {
  source = "git::ssh://git@github.com/segunofe/modules.git//rds"

  environment                = module.vpc.environment
  project_name               = module.vpc.project_name
  private_data_subnet_az1_id = module.vpc.private_data_subnet_az1_id
  private_data_subnet_az2_id = module.vpc.private_data_subnet_az2_id
  database_engine            = "mysql"
  multi_az_deployment        = false
  database_instance_class    = "db.t3.micro"
  rds_db_username            = module.secrets_manager.rds_db_username # instead of hardcoding the username, we can reference it from the secrets manager module
  rds_db_password            = module.secrets_manager.rds_db_password
  rds_db_name                = module.secrets_manager.rds_db_name
  database_security_group_id = module.security_groups.database_security_group_id
  availability_zone_1        = module.vpc.availability_zone_1
  publicly_accessible        = false

}

# Create EC2 Instance profile 
module "ec2_instance_profile" {
  source = "git::ssh://git@github.com/segunofe/modules.git//iam/ec2-instance-profile"

  environment  = module.vpc.environment
  project_name = module.vpc.project_name
}

# Create EC2 Instance for data migration 
module "data_migration_ec2_instance" {
  source = "git::ssh://git@github.com/segunofe/modules.git//data-migrate"

  amazon_linux_ami_id                 = "ami-0b0b78dcacbab728f"
  ec2_instance_type                   = "t3.micro"
  private_app_subnet_az1_id           = module.vpc.private_app_subnet_az1_id
  db_migrate_server_security_group_id = module.security_groups.db_migrate_server_security_group_id
  ec2_instance_profile_role_name      = module.ec2_instance_profile.ec2_instance_profile_role_name
  flyway_version                      = "11.19.1"
  sql_script_s3_uri                   = "s3://dev-so-app-webfiles/project-3-assets/V1__nest.sql"
  rds_endpoint                        = module.rds.rds_endpoint
  rds_db_name                         = module.secrets_manager.rds_db_name
  rds_db_username                     = module.secrets_manager.rds_db_username
  rds_db_password                     = module.secrets_manager.rds_db_password
  environment                         = module.vpc.environment
  project_name                        = module.vpc.project_name
}

# Request public SSL certificate from ACM
module "ssl_certificate" {
  source = "git::ssh://git@github.com/segunofe/modules.git//acm"

  domain_name       = "cloudsdew.com"
  alternative_names = "*.cloudsdew.com"
}

# Create Application Load Balancer
module "application_load_balancer" {
  source = "git::ssh://git@github.com/segunofe/modules.git//alb"

  environment           = module.vpc.environment
  project_name          = module.vpc.project_name
  alb_security_group_id = module.security_groups.alb_security_group_id
  public_subnet_az1_id  = module.vpc.public_subnet_az1_id
  public_subnet_az2_id  = module.vpc.public_subnet_az2_id
  target_type           = "ip"
  vpc_id                = module.vpc.vpc_id
  health_check_path     = "/index.php"
  certificate_arn       = module.ssl_certificate.certificate_arn
}

# Create ECS roles 
module "ecs_role" {
  source = "git::ssh://git@github.com/segunofe/modules.git//iam/ecs-role"

  environment  = module.vpc.environment
  project_name = module.vpc.project_name
}

# Create ECS
module "ecs" {
  source = "git::ssh://git@github.com/segunofe/modules.git//ecs"

  environment                  = module.vpc.environment
  project_name                 = module.vpc.project_name
  ecs_task_execution_role_arn  = module.ecs_role.ecs_task_execution_role_arn
  ecs_task_role_arn            = module.ecs_role.ecs_task_role_arn
  architecture                 = "X86_64"
  container_image              = "851725625129.dkr.ecr.us-east-2.amazonaws.com/nest-ecr-repo:latest"
  region                       = module.vpc.region
  private_app_subnet_az1_id    = module.vpc.private_app_subnet_az1_id
  private_app_subnet_az2_id    = module.vpc.private_app_subnet_az2_id
  app_server_security_group_id = module.security_groups.app_server_security_group_id
  alb_target_group_arn         = module.application_load_balancer.alb_target_group_arn

  depends_on = [module.data_migration_ec2_instance] # this line is saying that the ecs module depends on the data migration ec2 instance module, so terraform will create the data migration ec2 instance before creating the ecs resources.
}


# Create record set in Route53
# module "route_53" {
#   source = "git::ssh://git@github.com/segunofe/modules.git//route-53"

#   domain_name                        = module.ssl_certificate.domain_name
#   record_name                        = "www"
#   application_load_balancer_dns_name = module.application_load_balancer.application_load_balancer_dns_name
#   application_load_balancer_zone_id  = module.application_load_balancer.application_load_balancer_zone_id

# }


# Website URL
# output "website_url" {
#   value = join("", ["https://", module.route_53.record_name, ".", module.ssl_certificate.domain_name])
# }


# Output the DNS name of the load balancer so that we can use it to access the application.
output "load_balancer_dns" {
  value = module.application_load_balancer.application_load_balancer_dns_name
}

# adding these outputs for CICD pipeline 
output "domain_name" {
  value = module.ssl_certificate.domain_name
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "ecs_task_definition_name" {
  value = module.ecs.ecs_task_definition_name
}

output "ecs_cluster_name" {
  value = module.ecs.ecs_cluster_name
}

output "ecs_service_name" {
  value = module.ecs.ecs_service_name
}