resource "aws_instance" "db" {
  ami = data.aws_ami.amazon.id
  instance_type = "t2.micro"

  tags = {
    Name = "db-server"
  }
}

output "PrivateIP" {
  value = aws_instance.db.private_ip
}