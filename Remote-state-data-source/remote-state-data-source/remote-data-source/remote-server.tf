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

data "terraform_remote_state" "remoteDataSource" {
  backend = "s3"
  config = {
    bucket = "nfesta-tf-state-bucket"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}

/*data "terraform_remote_state" "localstatek" {
  backend = "local"
  config = {
      path    = "../remote-data-source/terraform.tfstate"
  }
}*/

# Terraform >= 0.12
resource "aws_instance" "remote-server" {
  ami = data.aws_ami.amazon.id
  instance_type = "t2.micro"
  subnet_id = data.terraform_remote_state.remoteDataSource.outputs.public_subnets[1]

  tags = {
    "Name" = "remote-server"
  }
}

/*
# Terraform <= 0.11
resource "aws_instance" "foo" {
  # ...
  subnet_id = "${data.terraform_remote_state.vpc.subnet_id}"
}
*/