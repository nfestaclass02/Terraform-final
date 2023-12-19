variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.50.0.0/16"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "ami" {
  default = "ami-0230bd60aa48260c6"
}

variable "public_subnet_cidr" {
    type = list
    default = ["10.50.0.0/24", "10.50.1.0/24"]
}

variable "private_subnet_cidr" {
  default = ["10.50.2.0/24", "10.50.3.0/24"]
}

variable "availability_zone" {
  type = list 
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}