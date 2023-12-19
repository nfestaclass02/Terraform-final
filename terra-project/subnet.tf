resource "aws_subnet" "public_subnets" {
  vpc_id     = "${aws_vpc.vpc_01.id}"
  cidr_block = "${var.public_subnet_cidr[0]}"
  availability_zone = "${var.availability_zone[1]}"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_01"
  }
}

resource "aws_subnet" "public_subnets_02" {
  vpc_id     = "${aws_vpc.vpc_01.id}"
  cidr_block = "${var.public_subnet_cidr[1]}"
  availability_zone = "${var.availability_zone[0]}"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnets_02"
  }
}
