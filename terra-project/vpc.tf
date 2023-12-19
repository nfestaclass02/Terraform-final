provider "aws" {
  region = "${var.region}"
  #profile = "default"
}

resource "aws_vpc" "vpc_01" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "vpc_01"
  }
}
resource "aws_internet_gateway" "testIGW_TF" {
  vpc_id = "${aws_vpc.vpc_01.id}"
  tags = {
    Name = "testIGW_TF"
  }
  depends_on = [aws_vpc.vpc_01]
}

resource "aws_eip" "EIP" {
  
}