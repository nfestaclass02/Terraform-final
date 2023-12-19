/*
# Terraform Block
terraform {
  required_version = "~> 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Provider Block
provider "aws" {
  region = "us-east-1"
  #profile = "default"
}
*/

terraform {
  backend "s3" {
    bucket = "nfesta-tf-state-bucket"
    key    = "DEV-terraform/terraform.tfstate"
    dynamodb_table = "terraform-lock"
    region = "us-east-1"
  }
}


/*
resource "aws_s3_bucket" "nfesta-tf-state-bucket" {
  bucket = "nfesta-tf-state-bucket"

  tags = {
    Name        = "nfesta-tf-state-bucket"
    Environment = "Dev"
  }
}

resource "aws_dynamodb_table" "tf_lock" {
  name = "terraform-lock"
  hash_key = "LockID"
  read_capacity = 3 
  write_capacity = 3 
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "Terraform-lock-table"
  }
  lifecycle {
     prevent_destroy = false
  }
}

*/