#Create the VPC
 resource "aws_vpc" "r2-vpc-poc" {                # Creating VPC here
   cidr_block       = var.r2_vpc_cidr     # Defining the CIDR block use 10.0.0.0/24 for demo
   instance_tenancy = "default"
   enable_dns_hostnames = "true"
   tags = {
     Name = var.vpcname
   }
 }
 #Create Internet Gateway and attach it to VPC
 resource "aws_internet_gateway" "IGW" {    # Creating Internet Gateway
    vpc_id =  aws_vpc.r2-vpc-poc.id               # vpc_id will be generated after we create VPC
    tags = {
     Name = var.r2_igw_poc
   }
 }
 #Create a Public Subnets.
 resource "aws_subnet" "publicsubnets" {    # Creating Public Subnets
   vpc_id =  aws_vpc.r2-vpc-poc.id
   count = length(var.public_subnets)
   cidr_block = element(var.public_subnets, count.index)       # CIDR block of public subnets
   availability_zone = element(var.r2_azs, count.index)
   tags = {
     Name = element(var.public_subnets_name, count.index)
   }
 }
 #Create a Private Subnet                   # Creating Private Subnets
 resource "aws_subnet" "privatesubnets" {
   vpc_id =  aws_vpc.r2-vpc-poc.id
   count = length(var.private_subnets)
   cidr_block = element(var.private_subnets, count.index)         # CIDR block of private subnets
   availability_zone = element(var.r2_azs, count.index)
   tags = {
     Name = element(var.private_subnets_name, count.index)
   }
 }
 #Route table for Public Subnet's
 resource "aws_route_table" "PublicRT" {    # Creating RT for Public Subnet
    vpc_id =  aws_vpc.r2-vpc-poc.id
    route {
    cidr_block = "0.0.0.0/0"               # Traffic from Public Subnet reaches Internet via Internet Gateway
    gateway_id = aws_internet_gateway.IGW.id
    }
 }
 #Route table for Private Subnet's
 resource "aws_route_table" "PrivateRT" {    # Creating RT for Private Subnet
   vpc_id = aws_vpc.r2-vpc-poc.id
   route {
   cidr_block = "0.0.0.0/0"             # Traffic from Private Subnet reaches Internet via NAT Gateway
   nat_gateway_id = aws_nat_gateway.NATgw.id
   }
 }
 #Route table Association with Public Subnet's
 resource "aws_route_table_association" "PublicRTassociation" {
    count = length(var.public_subnets)
    subnet_id = aws_subnet.publicsubnets[count.index].id
    route_table_id = aws_route_table.PublicRT.id
 }
 #Route table Association with Private Subnet's
 resource "aws_route_table_association" "PrivateRTassociation" {
    count = length(var.private_subnets)
    subnet_id = aws_subnet.privatesubnets[count.index].id
    route_table_id = aws_route_table.PrivateRT.id
 }
 resource "aws_eip" "nateIP" {
   domain   = "vpc"
 }
 #Creating the NAT Gateway using subnet_id and allocation_id
 resource "aws_nat_gateway" "NATgw" {
   allocation_id = aws_eip.nateIP.id
   subnet_id     = element(aws_subnet.publicsubnets.*.id, 0)
   tags = {
     Name = var.r2_nat_poc
   }
 }