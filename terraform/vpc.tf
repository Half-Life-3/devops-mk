#resource is a keyword for telling terraform it is going to create a resource
#reserved keyword for telling aws what type of resource it is ("aws_vpc") 
#then give the resource a name can be anything ("my_vpc")

resource "aws_vpc" "ecs_vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  tags = {
    Name = "new_terraform_vpc"
  }
}