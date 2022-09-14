# variable "subnet_public_cidr_block" {
#   type        = list(string)
#   description = "list of public cidr_blocks"
# }

# variable "subnet_private_cidr_block" {
#   type        = list(string)
#   description = "list of private cidr_block"
# }

variable "public_subnet_count" {
  type        = number
  description = "count of public public"
}

variable "private_subnet_count" {
  type        = number
  description = "count of private subnets"
}

variable "load_balancer_type" {
  type        = string
  description = "type of load balancer"
}

variable "vpc_cidr_block" {
  type        = string
  description = "cidr_block for subnets"
  default     = "10.0.0.0/16"
}
