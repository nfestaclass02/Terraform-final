# Terraform Block
terraform {
  required_version = "~> 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
# Provider Block
provider "aws" {
  region = "us-east-1"
  #profile = "default"
}

module "ec2module" {
  source = "./ec2"
  ec2name = "module-ec2"
}

output "module-ec2-output" {
  value = module.ec2module.instance_id
}