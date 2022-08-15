resource "aws_lb" "ecs_load_balancer" {
  name               = "ecs_load_balancer"
  internal           = false
  load_balancer_type = var.load_balancer_type
  subnets            = aws_subnet.public_subnet.*.id  #---------------
  security_groups = aws_security_group.ecs_load_balancer_security_group.arn

  enable_deletion_protection = true

  tags = {
    Name = "ecs_load_balancer"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.ecs_load_balancer.arn
  port              = "8083"
  protocol          = "tcp"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.bank_target_group.arn
  }
}


resource "aws_lb_target_group" "bank_target_group" {
  name     = "bank target group"
  port     = 8083
  protocol = "tcp"
  vpc_id   = aws_vpc.ecs_vpc.id
}
