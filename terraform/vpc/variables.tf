variable "vpc_cidr_block" {
    type = string
    description = "cidr_block for subnets"
    default = "10.0.0.0/16"
}

variable "vpc_name"{
    type = string
    description = "name for vpc"
}