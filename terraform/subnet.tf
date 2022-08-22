resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.ecs_vpc.id
  cidr_block = var.public_subnet_cidr_block
  availability_zone = data.aws_availability_zones.available.names[0]
  count = 1#--------------
  tags = {
    Name = "ecs_public_subnet"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id     = aws_vpc.ecs_vpc.id
  cidr_block = var.public_subnet_cidr_block2
  availability_zone = data.aws_availability_zones.available.names[1]
  count = 1#--------------
  tags = {
    Name = "ecs_public_subnet2"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.ecs_vpc.id
  cidr_block = var.private_subnet_cidr_block
  availability_zone = data.aws_availability_zones.available.names[0]
  #availability_zone = "us-east-1a"
  count = 1#--------------
  tags = {
    Name = "ecs_private_subnet"
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id     = aws_vpc.ecs_vpc.id
  cidr_block = var.private_subnet_cidr_block2
  availability_zone = data.aws_availability_zones.available.names[1]
  #availability_zone = "us-east-1b"

  count = 1#--------------
  tags = {
    Name = "ecs_private_subnet2"
  }
}


resource "aws_nat_gateway" "private_nat_gateway" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.private_subnet.id[0]
}

resource "aws_nat_gateway" "private_nat_gateway2" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.private_subnet2.id[0]
}