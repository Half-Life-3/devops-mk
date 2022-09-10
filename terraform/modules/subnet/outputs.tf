output "public_subnet"{
    description = "name for public_subnet"
    value = [for subnet in aws_subnet.public_subnet : subnet.id]
}

output "private_subnet"{
    description = "name for private_subnet"
    value = [for subnet in aws_subnet.private_subnet : subnet.id]
}

