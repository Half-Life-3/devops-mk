variable "public_subnet_cidr_block" {
    type = string
    description = "cidr_block for public subnets"
    default = "10.0.0.0/24"
}

variable "private_subnet_cidr_block" {
    type = string
    description = "cidr_block for private subnets"
    default = "10.0.10.0/24"
}

variable "availability_zone"{
    description = "availability_zone for ecs"
    type = string
    default = "us-east-1a"
}
