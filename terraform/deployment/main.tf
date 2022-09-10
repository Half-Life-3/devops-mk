module "vpc" {
  source = "../modules/vpc"
}

module "subnet" {
  source               = "../modules/subnet"
  vpc_cidr_block       = var.vpc_cidr_block
  test_aws_vpc         = module.vpc.test_aws_vpc
  public_subnet_count  = var.public_subnet_count
  private_subnet_count = var.private_subnet_count
}

module "routing" {
  source               = "../modules/routing"
  test_aws_vpc         = module.vpc.test_aws_vpc
  public_subnet        = module.subnet.public_subnet
  private_subnet       = module.subnet.private_subnet
  public_subnet_count  = var.public_subnet_count
  private_subnet_count = var.private_subnet_count
}

module "load_balancer" {
  source             = "../modules/load-balancer"
  test_aws_vpc       = module.vpc.test_aws_vpc
  load_balancer_type = var.load_balancer_type
  public_subnet      = module.subnet.public_subnet
}
