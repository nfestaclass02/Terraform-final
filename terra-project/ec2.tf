resource "aws_instance" "terra_instance_02" {
  ami = "${data.aws_ami.amazon.id}"
  instance_type = "${var.instance_type}"
  user_data = file("${path.module}/user-data.sh")
  vpc_security_group_ids = ["${aws_security_group.ec2_sg_01.id}","${aws_security_group.ec2_sg_http.id}"]
  subnet_id = "${aws_subnet.public_subnets.id}"
  key_name = "maven-key"
  tags = {
    "Name" = "terra_instance_02"
  }
}

resource "aws_instance" "terra_instance_03" {
  ami = "${data.aws_ami.amazon.id}"
  instance_type = "${var.instance_type}"
  user_data = file("${path.module}/user-data.sh")
  vpc_security_group_ids = ["${aws_security_group.ec2_sg_01.id}","${aws_security_group.ec2_sg_http.id}"]
  subnet_id = "${aws_subnet.public_subnets.id}"
  key_name = "maven-key"
  tags = {
    "Name" = "terra_instance_03"
  }
}

output "instance_id" {
  value = aws_instance.terra_instance_02.id
}