terraform {
  backend "s3" {
    bucket  = "nestso-terraform-remote-state-bucket"        # the name of the S3 bucket
    key     = "terraform-module/nest/ecs/terraform.tfstate" #the key lets me use the same bucket for different environments and resources
    region  = "us-east-2"
    encrypt = true

    dynamodb_table = "terraform-state-lock" # the name of the dynamoDB table 
    profile        = "default"              # profile is the name of the AWS CLI profile to use for authentication
  }
}