resource "aws_instance" "my-ec2" {
  ami = data.aws_ami.amazon.id
  instance_type = "${var.my_instance_type}"
}