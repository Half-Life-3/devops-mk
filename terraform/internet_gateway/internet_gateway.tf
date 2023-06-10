resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.ecs_vpc.id
  tags = {
    Name = "ecs_internet_gateway"
  }
}