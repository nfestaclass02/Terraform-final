resource "aws_alb" "myalb-01" {
  load_balancer_type = "application"
  name     = "myalb-01"
  internal = false
  security_groups = ["${aws_security_group.ec2_sg_http.id}"]

  tags = {
    Name = "myalb-01"
  }
  subnets = ["${aws_subnet.public_subnets.id}","${aws_subnet.public_subnets_02.id}"]
  depends_on = [aws_subnet.public_subnets,aws_subnet.public_subnets_02,aws_security_group.ec2_sg_http]
}

resource "aws_alb_target_group" "myalb-tg-01" {
  name   = "myalb-tg-01"
  vpc_id = "${aws_vpc.vpc_01.id}"
  port   = "80"
  protocol = "HTTP"
  health_check {
    path = "/"
    port = "80"
    healthy_threshold = 5
    unhealthy_threshold = 2
    interval = 5
    timeout = 4
    matcher = "200"
  }

  tags = {
    Name = "myalb-tg-01"
  }
}

resource "aws_alb_target_group_attachment" "target_alb" {
  target_group_arn = "${aws_alb_target_group.myalb-tg-01.arn}"
  target_id        = "${aws_instance.terra_instance_02.id}"
}

resource "aws_alb_target_group_attachment" "target_alb_02" {
  target_group_arn = "${aws_alb_target_group.myalb-tg-01.arn}"
  target_id        = "${aws_instance.terra_instance_03.id}"
}


resource "aws_alb_listener" "http" {
  load_balancer_arn = "${aws_alb.myalb-01.arn}"
  port     = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = "${aws_alb_target_group.myalb-tg-01.arn}"
  }
  depends_on = [aws_alb.myalb-01,aws_alb_target_group.myalb-tg-01]
}