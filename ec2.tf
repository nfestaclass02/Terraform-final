provider "aws" {
  region = "${var.region}"
  #profile = "default"
}

resource "aws_instance" "terra_instance_02" {
  ami = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  tags = {
    "Name" = "terra_instance_02"
  }
  user_data = 
}



Amazon Linux 2023 AMI * x86_64 HVM kernel-6.1 

al2023-ami-*-kernel-6.1-x86_64
ami-0230bd60aa48260c6

amazon/al2023-ami-*-kernel-6.1-x86_64

#data source
#Get latest AMI ID for Amazon Linux OS
data "aws_ami" "amazonlinux" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amazon/al2023-ami-*-kernel-6.1-x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}