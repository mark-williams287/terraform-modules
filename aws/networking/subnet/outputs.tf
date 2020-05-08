output "public_subnet_ids" {
  description = "Ids of the created public subnets"
  value = aws_subnet.public.*.id
}

output "private_subnet_ids" {
  description = "Ids of the created private subnets"
  value = aws_subnet.private.*.id
}

output "public_subnet_cidrs" {
  description = "CIDR blocks of the created public subnets"
  value = aws_subnet.public.*.cidr_block
}

output "private_subnet_cidrs" {
  description = "CIDR blocks of the created private subnets"
  value = aws_subnet.private.*.cidr_block
}

output "public_route_table_ids" {
  description = "Ids of the created public route tables"
  value = aws_route_table.public.*.id
}

output "private_route_table_ids" {
  description = "Ids of the created private route tables"
  value = aws_route_table.private.*.id
}

output "nat_gateway_ids" {
  description = "Ids of the NAT Gateways created"
  value = aws_nat_gateway.default.*.id
}

output "availability_zones" {
  description = "List of Availability Zones where subnets were created"
  value = var.availability_zones
}

output "az_subnet_ids" {
  description = "Map of AZ names to subnet Ids"
  value = zipmap(
  var.availability_zones,
  coalescelist(aws_subnet.private.*.id, aws_subnet.public.*.id)
  )
}

output "az_subnet_arns" {
  description = "Map of AZ names to subnet ARNs"
  value = zipmap(
  var.availability_zones,
  coalescelist(aws_subnet.private.*.arn, aws_subnet.public.*.arn)
  )
}
