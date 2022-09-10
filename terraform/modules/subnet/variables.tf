variable "vpc_cidr_block" {
    type = string
    description = "cidr_block for subnets"
}

variable "test_aws_vpc"{
    type = string
    description = "name of vpc"
}

variable "public_subnet_count"{
    type = number
    description = "count of public subnets"
}

variable "private_subnet_count"{
    type = number
    description = "count of private subnets"
}