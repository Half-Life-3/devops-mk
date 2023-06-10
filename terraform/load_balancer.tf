resource "aws_lb" "ecs-load-balancer" {
  name               = "ecs-load-balancer"
  internal           = false
  load_balancer_type = var.load_balancer_type
  subnets            = aws_subnet.public_subnet.*.id  #---------------
  #security_groups = [aws_security_group.ecs_load_balancer_security_group.id]

  enable_deletion_protection = true

  tags = {
    Name = "ecs-load-balancer"
  }
}

# resource "aws_lb_listener" "front_end" {
#   load_balancer_arn = aws_lb.ecs-load-balancer.arn
#   port              = "8083"
#   protocol          = "TCP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.bank-target-group.arn
#   }
# }

# resource "aws_lb_target_group" "bank-target-group" {
#   name     = "bank-target-group"
#   port     = 8083
#   protocol = "TCP"
#   vpc_id   = aws_vpc.ecs_vpc.id
# }
