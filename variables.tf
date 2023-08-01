#---confirmed---#
variable "vpcname" {}
variable "r2_vpc_cidr" {}
variable "private_subnets" {}
variable "public_subnets" {}
variable "r2_azs"{}
variable "public_subnets_name"{}
variable "private_subnets_name"{}
variable "r2_igw_poc"{}
variable "r2_nat_poc"{}





variable "root_password" {
    type = string
    default = "12345"
}
variable "ami" {}

variable "instance_types" {}

variable "key_name" {}
variable "ec2_name" {}


#-----RDS----------
variable "engine" {
  description = "The database engine to use"
  type        = string
  default     = "mysql"
}
variable "engine_version" {
description = "The engine version to use"
default     = "8.0.32"
}

variable "identifier" {
description = "The identifier"
default     = "r2-poc-db1"
}

variable "instance_class" {
description = "The instance type of the RDS instance"
default     = "db.t2.micro"
}

variable "allocated_storage" {
description = "The allocated storage in gigabytes"
default     = 20
}

variable "storage_type" {
description = "The allocated storage in gigabytes"
type        = string
default     = "gp2"
}

# variable "db_name" {
# description = "The DB name to create"
# default     = "mydb"
# }

variable "username" {
description = "The name of master user for the client DB"
default     = "pocims"
}

variable "password" {
description = "The password for the master DB user"
default     = "ims12345"
}

variable "port" {
description = "The port on which the DB accepts connections"
default     = "3306"
}

variable "availability_zones" {
description = "A list of availability zones in which to create the subnets"
type        = list(string)
default     = ["us-east-2a", "us-east-2b"]
}

variable "vpc_security_group_id" {
description = "A list of VPC security group IDs to associate with RDS instances"
type        = list(string)
default     = ["sg-12345678"]
}
variable "subnets_ids" {
description = "A list of VPC security group IDs to associate with RDS instances"
type        = list(string)
default     = ["subnet-024efadda7e69d4ca", "subnet-0be922c3326ab078a"]
}

variable "rds_group" {
description = "A list of VPC security group IDs to associate with RDS instances"
type        = string
default     = "poc-db1"
}

variable "region" {
  description = "The region for AWS resource"
  default     = "us-east-2"
}
variable "name" {
    type = list(string)
    description = "List of names for EC2 instances"
    default = ["test", "real"]
}


# variable "root_password" {
#     type = string
#     default = "12345"
# }




#rds
variable "db_name" {
    type = string
}

variable "db_instance_class" {
    type = string
}

variable "db_allocated_storage" {
    type = number
}

variable "db_engine" {
    type = string
}

variable "db_engine_version" {
    type = string
}

variable "db_username" {
    type = string
}

variable "db_password" {
    type = string
}
