variable "test_aws_vpc"{
    type = string
    description = "name of vpc"
}

variable "public_subnet"{
    type = list(string)
    description = "name for public_subnet"  
}

variable "private_subnet"{
    type = list(string)
    description = "name for private_subnet"
}

variable "public_subnet_count" {
  type        = number
  description = "count of public public"
}

variable "private_subnet_count" {
  type        = number
  description = "count of private subnets"
}