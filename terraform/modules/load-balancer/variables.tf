variable "load_balancer_type" {
    type = string
    description = "type of load balancer"
}

variable "test_aws_vpc"{
    type = string
    description = "name of vpc"
}

variable "public_subnet"{
    type = list(string)
    description = "name for public_subnet"
    
}