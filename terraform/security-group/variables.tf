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