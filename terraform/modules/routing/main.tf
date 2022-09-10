resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = var.test_aws_vpc
  tags = {
    Name = "aws_internet_gateway-mk"
  }
}
#------------------------------------------------------------------------------------
resource "aws_nat_gateway" "private_nat_gateway" {
    allocation_id     = aws_eip.default_eip.id 
    subnet_id         = var.private_subnet[0]
    depends_on = [aws_internet_gateway.internet_gateway]
}

resource "aws_eip" "default_eip" {
  vpc      = true
  depends_on = [aws_internet_gateway.internet_gateway]
}

resource "aws_route_table" "public_route_table" {
  vpc_id = var.test_aws_vpc

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "aws_route_table for public"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = var.test_aws_vpc

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.private_nat_gateway.id
  }

  tags = {
    Name = "aws_route_table for private"
  }
}

resource "aws_route_table_association" "public_route_table_association" {
  count = var.public_subnet_count
  subnet_id      = var.public_subnet[count.index]
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_route_table_association" {
  count = var.private_subnet_count
  subnet_id      = var.private_subnet[count.index]
  route_table_id = aws_route_table.private_route_table.id
}