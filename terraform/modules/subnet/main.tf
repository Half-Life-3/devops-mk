data "aws_availability_zones" "available"{
  state = "available"
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = var.test_aws_vpc
  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, count.index)
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.names[count.index]
  count = var.public_subnet_count
  tags = {
    Name = "public_subnet-${count.index}"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = var.test_aws_vpc
  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, count.index + var.private_subnet_count)
  map_public_ip_on_launch = false
  availability_zone = data.aws_availability_zones.available.names[count.index]
  #availability_zone = "us-east-1a"
  count = var.private_subnet_count
  tags = {
    Name = "private_subnet-${count.index}"
  }
}