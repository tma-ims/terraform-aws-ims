variable "name" {}
variable "availability_zone" {}
variable "ami" {}
variable "instance_type" {}
variable "subnet_id" {}
# variable "root_password" {}
variable "key_name" {}
variable "vpc_id" {}
// variable "vpc_security_group_ids" {
//     type = list(string)
//     description = "Security group IDs of the EC2 instance"
// }
variable "db_username" {}
variable "db_password" {}
# variable "rds_endpoint" {}
variable "rds_address" {}