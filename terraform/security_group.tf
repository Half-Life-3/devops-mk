resource "aws_security_group" "ecs_load_balancer_security_group" {
  name        = var.internet_gateway_security_group_name
  description = "bank microservice security group"
  vpc_id      = aws_vpc.ecs_vpc.id

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
    Name = var.internet_gateway_security_group_name
  }
}

resource "aws_security_group" "bank_microservice_security_group" {
  name        = var.bank_microservice_security_group_name
  description = "bank microservice security group"
  vpc_id      = aws_vpc.ecs_vpc.id

  ingress {
    description      = "allow bank"
    from_port        = 8083
    to_port          = 8083
    protocol         = "TCP"
    security_groups  = [aws_security_group.ecs_load_balancer_security_group.id]
  }
  ingress {
    description      = "allow database"
    from_port        = 3306
    to_port          = 3306
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.bank_microservice_security_group_name
  }
}
