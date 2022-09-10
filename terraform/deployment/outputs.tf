output "test_aws_vpc" {
  description = "name for vpc"
  value       = module.vpc.test_aws_vpc
}

output "public_subnet" {
  description = "name for public_subnet"
  value       = module.subnet.public_subnet
}

output "private_subnet" {
  description = "name for private_subnet"
  value       = module.subnet.private_subnet
}

