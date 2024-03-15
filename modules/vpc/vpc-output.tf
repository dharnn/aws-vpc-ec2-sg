output "vpc_id" {
    value = aws_vpc.vpc_1.id
}

output "public_subnet_id" {
    value = aws_subnet.public_subnet[*].id
}