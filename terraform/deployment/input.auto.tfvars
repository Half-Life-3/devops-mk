load_balancer_type        = "application"
subnet_public_cidr_block  = ["10.0.0.0/24", "10.0.1.0/24"]
subnet_private_cidr_block = ["10.0.10.0/24", "10.0.11.0/24"]
public_subnet_count       = 2
private_subnet_count      = 2
vpc_cidr_block            = "10.0.0.0/16"