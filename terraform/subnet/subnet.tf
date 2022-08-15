resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.ecs_vpc.id
  cidr_block = var.public_subnet_cidr_block
  availability_zone = data.aws_availability_zone.available.names[0]
  count = 2#--------------
  tags = {
    Name = "ecs_public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.ecs_vpc.id
  cidr_block = var.private_subnet_cidr_block
  availability_zone = data.aws_availability_zone.available.names[0]
  count = 2#--------------
  tags = {
    Name = "ecs_private_subnet"
  }
}