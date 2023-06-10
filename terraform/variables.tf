variable "vpc_cidr_block" {
    type = string
    description = "cidr_block for subnets"
    default = "10.0.0.0/16"
}

variable "vpc_name"{
    type = string
    description = "name for vpc"
    default = "ecs-vpc"
}

variable "load_balancer_type" {
    type = string
    description = "type of load balancer"
    default = "network"
}

variable "security_group_name" {
    type = string
    description = "name of security group"
    default = "ecs_security_group"
}


variable "bank_microservice_security_group_name" {
    type = string
    description = "name of security group"
    default = "bank_security_group"
}


variable "internet_gateway_security_group_name" {
    type = string
    description = "name of security group"
    default = "internet_gateway_security_group"
}

variable "public_subnet_cidr_block" {
    type = string
    description = "cidr_block for public subnets"
    default = "10.0.69.0/24"
}

variable "private_subnet_cidr_block" {
    type = string
    description = "cidr_block for private subnets"
    default = "10.0.100.0/24"
}

variable "public_subnet_cidr_block2" {
    type = string
    description = "cidr_block for public subnets"
    default = "10.0.70.0/24"
}

variable "private_subnet_cidr_block2" {
    type = string
    description = "cidr_block for private subnets"
    default = "10.0.101.0/24"
}



variable "availability_zone"{
    description = "availability_zone for ecs"
    type = string
    default = "us-east-1"
}
