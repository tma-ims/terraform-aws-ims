
# VPC
################################################################################
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = module.vpc.vpc_arn
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "vpc_owner_id" {
  description = "The ID of the AWS account that owns the VPC"
  value       = module.vpc.vpc_owner_id
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

/*
output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = module.vpc.aws_internet_gateway_id
}

output "igw_arn" {
  description = "The ARN of the Internet Gateway"
  value       = aws_internet_gateway.IGW.arn
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

output "natgw_íp" {
  description = "List of NAT Gateway IPs"
  value       = aws_nat_gateway.NATgw[*].public_ip
}
*/
################################################################################
# Private Subnets
################################################################################

output "private_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.private_subnets
}
/*
output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = aws_subnet.publicsubnets[*].arn
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = compact(aws_subnet.publicsubnets[*].cidr_block)
}

output "public_subnets_ipv6_cidr_blocks" {
  description = "List of IPv6 cidr_blocks of public subnets in an IPv6 enabled VPC"
  value       = compact(aws_subnet.publicsubnets[*].ipv6_cidr_block)
}


output "public_route_table_association_ids" {
  description = "List of IDs of the public route table association"
  value       = aws_route_table_association.PublicRTassociation[*].id
}


################################################################################
# Private Subnets
################################################################################

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.privatesubnets[*].id
}

output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = aws_subnet.privatesubnets[*].arn
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = compact(aws_subnet.privatesubnets[*].cidr_block)
}

output "private_subnets_ipv6_cidr_blocks" {
  description = "List of IPv6 cidr_blocks of private subnets in an IPv6 enabled VPC"
  value       = compact(aws_subnet.privatesubnets[*].ipv6_cidr_block)
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
  value       = aws_route_table_association.PrivateRTassociation[*].id
}
*/
################################################################################
# AWS Instances 
################################################################################
# output "r2_poc_ec2" {
#   description = "List of IDs of private route tables"
#   value       = module.ec2.instances_id
# }

# output "instances_eip" {
#   description = "The EIP of the EC2"
#   value       = module.ec2.instances_eip
# }
output "instances_eip" {
  value = module.ec2.instances_eip
}
# output "instances_eip_dns" {
#   description = "The EIP of the EC2"
#   value       = module.ec2.instances_eip_dns
# }

################################################################################
# ALB  
################################################################################

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "alb_target_group_arn" {
  value = module.alb.alb_target_group_arn
}

################################################################################
# RDS 
################################################################################

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}
