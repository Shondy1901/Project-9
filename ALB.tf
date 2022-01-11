# Create an Application Load Balancer

resource "aws_lb" "proj9_alb" {
  name               = "proj9-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.project9_SG.id]
  subnets            = [aws_subnet.proj9_pub_sub1.id, aws_subnet.proj9_pub_sub2.id]

  enable_deletion_protection = false

}


# ALB Target Group

resource "aws_lb_target_group" "project9_TG" {
  name     = "project9-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.project9_vpc.id
}