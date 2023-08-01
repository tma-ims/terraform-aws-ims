provider "aws" {
  region     = "us-east-2"
}
/* # Maintain the statefile in s3
terraform {
  backend "s3" {
    region  = "ap-southeast-2"
    encrypt = true
  }
}
*/





module "vpc" {
  source               = "./vpc"
  r2_vpc_cidr          = var.r2_vpc_cidr
  r2_azs               = var.r2_azs
  vpcname              = var.vpcname
  r2_igw_poc           = var.r2_igw_poc
  private_subnets      = var.private_subnets
  public_subnets       = var.public_subnets
  public_subnets_name  = var.public_subnets_name
  private_subnets_name = var.private_subnets_name
  r2_nat_poc           = var.r2_nat_poc
  
}
#----vpc_sg----
module "vpc_sg" {
  source               = "./vpc_sg"
  vpc_id               = module.vpc.vpc_id
}

#----ec2--------
module "ec2" {
  source                 = "./ec2"
  name                   = var.ec2_name
  availability_zone      = var.r2_azs
  ami                    = var.ami
  instance_type          = var.instance_types
  vpc_id                 = module.vpc.vpc_id
  subnet_id              = module.vpc.public_subnets
  # root_password        = var.root_password
  key_name               = var.key_name
  depends_on = [module.rds]
  db_username             = var.db_username
  db_password             = var.db_password
  rds_address = module.rds.rds_address

}

#----rds--------
module "rds" {
  source = "./rds"
  identifier           = var.db_name
  instance_class       = var.db_instance_class
  allocated_storage    = var.db_allocated_storage
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  username             = var.db_username
  password             = var.db_password
  subnet_id            = module.vpc.private_subnets
  vpc_id               = module.vpc.vpc_id
  # db_subnet_group_name = aws_db_subnet_group.rds.name
  # vpc_security_group_ids   = var.vpc_security_group_ids
  # vpc_security_group_ids = module.vpc.security_group_id
  }


module "alb" {
  source          = "./alb"
  vpc_id          = "${module.vpc.vpc_id}"
  r2-poc-web1     = "${module.ec2.instances_id[0]}"
  r2-poc-web2     = "${module.ec2.instances_id[1]}"
  public_subnets  = "${module.vpc.public_subnets}"
  private_subnets = "${module.vpc.private_subnets}"
  # depends_on = [module.ec2]
}