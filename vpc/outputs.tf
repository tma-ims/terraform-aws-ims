################################################################################
# VPC
################################################################################
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.r2-vpc-poc.id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = aws_vpc.r2-vpc-poc.arn
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.r2-vpc-poc.cidr_block
}

output "vpc_owner_id" {
  description = "The ID of the AWS account that owns the VPC"
  value       = aws_vpc.r2-vpc-poc.owner_id
}
output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.IGW.id
}

output "default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value       = aws_vpc.r2-vpc-poc.default_security_group_id
}


output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = aws_vpc.r2-vpc-poc.enable_dns_support
}

################################################################################
# NAT Gateway
################################################################################

output "nat_ids" {
  description = "List of allocation ID of Elastic IPs created for AWS NAT Gateway"
  value       = aws_eip.nateIP[*].id
}

output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = aws_eip.nateIP[*].public_ip
}

output "natgw_ids" {
  description = "List of NAT Gateway IDs"
  value       = aws_nat_gateway.NATgw[*].id
}

output "natgw_ip" {
  description = "List of NAT Gateway IPs"
  value       = aws_nat_gateway.NATgw[*].public_ip
}

################################################################################
# Public Subnets
################################################################################

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.publicsubnets.*.id
}

output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = aws_subnet.publicsubnets.*.arn
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = compact(aws_subnet.publicsubnets.*.cidr_block)
}

output "public_subnets_ipv6_cidr_blocks" {
  description = "List of IPv6 cidr_blocks of public subnets in an IPv6 enabled VPC"
  value       = compact(aws_subnet.publicsubnets.*.ipv6_cidr_block)
}


output "public_route_table_association_ids" {
  description = "List of IDs of the public route table association"
  value       = aws_route_table_association.PublicRTassociation.*.id
}


################################################################################
# Private Subnets
################################################################################

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.privatesubnets.*.id
}

output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = aws_subnet.privatesubnets.*.arn
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = compact(aws_subnet.privatesubnets.*.cidr_block)
}

output "private_subnets_ipv6_cidr_blocks" {
  description = "List of IPv6 cidr_blocks of private subnets in an IPv6 enabled VPC"
  value       = compact(aws_subnet.privatesubnets.*.ipv6_cidr_block)
}

output "private_route_table_ids" {
  description = "List of IDs of private route tables"
  value       = aws_route_table.PrivateRT.id
}

output "private_nat_gateway_route_ids" {
  description = "List of IDs of the private nat gateway route"
  value       = aws_nat_gateway.NATgw.id
}


output "private_route_table_association_ids" {
  description = "List of IDs of the private route table association"
  value       = aws_route_table_association.PrivateRTassociation.*.id
}



/*
output "public_network_acl_id" {
  description = "ID of the public network ACL"
  value       = aws_network_acl.PublicRTassociation.id
}

output "public_network_acl_arn" {
  description = "ARN of the public network ACL"
  value       = aws_network_acl.PublicRTassociation.arn
}

output "private_network_acl_id" {
  description = "ID of the private network ACL"
  value       = try(aws_network_acl.private[0].id, null)
}

output "private_network_acl_arn" {
  description = "ARN of the private network ACL"
  value       = try(aws_network_acl.private[0].arn, null)
}

output "default_network_acl_id" {
  description = "The ID of the default network ACL"
  value       = try(aws_vpc.r2-vpc-poc[0].default_network_acl_id, null)
}

output "default_route_table_id" {
  description = "The ID of the default route table"
  value       = try(aws_vpc.r2-vpc-poc[0].default_route_table_id, null)
}

output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = try(aws_vpc.r2-vpc-poc[0].enable_dns_hostnames, null)
}

output "vpc_main_route_table_id" {
  description = "The ID of the main route table associated with this VPC"
  value       = try(aws_vpc.r2-vpc-poc[0].main_route_table_id, null)
}

output "vpc_ipv6_association_id" {
  description = "The association ID for the IPv6 CIDR block"
  value       = try(aws_vpc.r2-vpc-poc[0].ipv6_association_id, null)
}

output "vpc_ipv6_cidr_block" {
  description = "The IPv6 CIDR block"
  value       = try(aws_vpc.r2-vpc-poc[0].ipv6_cidr_block, null)
}
*/
