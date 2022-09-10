resource "aws_lb" "load-balancer-mk" {
  name               = "terraform-load-balancer"
  internal           = false
  load_balancer_type = var.load_balancer_type
  subnets            = var.public_subnet.*
  security_groups = [aws_security_group.terraform_security_group.id]
  enable_deletion_protection = false
  tags = {
    Name = "default-load-balancer-mk"
  }
}

resource "aws_security_group" "terraform_security_group" {
  name        =  "terraform_security_group"
  description = "default terraform security group"
  vpc_id      =  var.test_aws_vpc

  ingress {
    description      = "allow internet gateway"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "default_terraform_security_group"
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
