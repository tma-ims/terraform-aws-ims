#---confirmed---
vpcname="r2-vpc-poc"
r2_vpc_cidr="10.72.0.0/16"
r2_igw_poc="r2-igw-poc"
public_subnets=["10.72.1.0/24", "10.72.2.0/24"]
private_subnets=["10.72.3.0/24", "10.72.4.0/24"]
r2_azs=["us-east-2a", "us-east-2b"]
public_subnets_name=["r2-sn-poc-pub-1", "r2-sn-poc-pub-2"]
private_subnets_name=["r2-sn-poc-pvt-3", "r2-sn-poc-pvt-4"]
r2_nat_poc="r2-nat-poc"

#---ec2-----
ami = "ami-024e6efaf93d85776"
# "ami-0e820afa569e84cc1"
instance_types = "t2.micro"
ec2_name = ["web-srv-1","web-srv-2"]
key_name = "value"
#----rds------
db_name              = "r2-poc-rds"
db_instance_class    = "db.t2.micro"
db_allocated_storage = 5
db_engine            = "mysql"
db_engine_version    = "8.0.32"
db_username          = "user"
db_password          = "nhat123456"
db_username1          = "user1"
db_password1          = "nhat123456"