resource "aws_route_table" "pub_rtb_01" {
  vpc_id = "${aws_vpc.vpc_01.id}"
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.testIGW_TF.id
  }
  tags = {
    Name = "pub_rtb_01"
  }
}

resource "aws_route_table_association" "pub_rtb_association" {
 route_table_id = aws_route_table.pub_rtb_01.id
 subnet_id = aws_subnet.public_subnets.id
 depends_on = [aws_subnet.public_subnets,aws_route_table.pub_rtb_01]
}

resource "aws_route_table_association" "pub_rtb_association_02" {
 route_table_id = aws_route_table.pub_rtb_01.id
 subnet_id = aws_subnet.public_subnets_02.id
 depends_on = [aws_subnet.public_subnets_02,aws_route_table.pub_rtb_01]
}