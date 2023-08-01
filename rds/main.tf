resource "aws_db_subnet_group" "rds" {
    # count = length(var.identifier)
    name       = "r2-rds-subnet-group"
    subnet_ids = var.subnet_id

    tags = {
        Name = var.identifier
    }
}

resource "aws_security_group" "rds" {
    name        = "${var.identifier}"
    description = "${var.identifier} RDS security group"
    vpc_id      = var.vpc_id

    ingress {
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "${var.identifier} RDS ingress"
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "${var.identifier} RDS egress"
    }

    tags = {
        Name        = "${var.identifier}"
        Environment = var.identifier
    }
}

resource "aws_db_instance" "rds" {
    # count = length(var.identifier)
    identifier               = var.identifier
    instance_class           = var.instance_class
    allocated_storage        = var.allocated_storage
    engine                   = var.engine
    engine_version           = var.engine_version
    username                 = var.username
    password                 = var.password
    db_subnet_group_name     = aws_db_subnet_group.rds.name
    vpc_security_group_ids   = [aws_security_group.rds.id]
    backup_retention_period = 5
    publicly_accessible      = true
    skip_final_snapshot       = true # fix error: final_snapshot_identifier is required when skip_final_snapshot is false when deptroying 

}

resource "aws_db_instance" "rds-replica" {
    # count = length(var.identifier)
    identifier               = "${var.identifier}-replica"
    instance_class           = var.instance_class
    # allocated_storage        = var.allocated_storage
    # engine                   = var.engine
    # engine_version           = var.engine_version
    # username                 = var.username1
    # password                 = var.password1
    # db_subnet_group_name     = "us-east-2b"
    vpc_security_group_ids   = [aws_security_group.rds.id]
    publicly_accessible      = true
    skip_final_snapshot       = true 
    replicate_source_db      = aws_db_instance.rds.identifier
}
