resource "aws_key_pair" "demo" {
    key_name   = var.key_name
    public_key = file("id_rsa.pub")
}

resource "aws_security_group" "ec2_sg" {
  name        =  "web-srv-sg"
  description = "Allow traffic ec2 connections"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_traffic_ec2_sg"
  }
}

resource "aws_instance" "this" {
    count = length(var.name)
    ami           = var.ami
    instance_type = var.instance_type
    subnet_id = var.subnet_id[count.index]
    availability_zone = var.availability_zone[count.index]
    security_groups = aws_security_group.ec2_sg.*.id
    # associate_public_ip_address = true
    key_name = aws_key_pair.demo.key_name
    tags = {
        Name = var.name[count.index]
    }
    #   usr/share/nginx/html/index.html
        user_data = <<-EOF
        #!/bin/bash
        sed -i 's/#PermitRootLogin prohibit-password/ PermitRootLogin yes/' /etc/ssh/sshd_config
        service sshd restart
        sudo su -
        cd /root/
        echo "hello world" ${var.rds_address} > /root/test.txt
        sudo apt-get install nginx -y
        sudo systemctl start nginx
        sudo systemctl enable nginx  
        echo "<html> <head> <title>Welcome to Dreams's Theater</title> <style> html { color-scheme: light dark; } body { width: 35em; margin: 0 auto; font-family: Tahoma, Verdana, Arial, sans-serif; } </style> </head> <body> <h1>Welcome to Dreams's Theater</h1> <img src=https://upload.wikimedia.org/wikipedia/commons/f/f9/TMA-Solutions-Logo.png>" > /var/www/html/index.nginx-debian.html    
        apt-get install mysql-server -y
        echo mysql -h ${var.rds_address} -u "${var.db_username}" -P 3306 --password="${var.db_password}" > /root/infor.txt
        echo -e "\tCREATE DATABASE poc2023;\n\tUSE poc2023;\n\tCREATE TABLE NhanVien (PersonID INT(11), LastName VARCHAR(255), FirstName VARCHAR(255));\n\tINSERT INTO NhanVien (PersonID, LastName, FirstName) VALUES ('1', 'Tran Van', ' Nhat'), ('2', 'Nguyen', 'Thanh');" > /root/mysql-load-table.sql
        mysql -h ${var.rds_address} -u "${var.db_username}" -P 3306 --password="${var.db_password}" < /root/mysql-load-table.sql
        EOF
}
resource "aws_eip" "web" {
    count = length(var.name)
    instance = aws_instance.this[count.index].id
}

# cat <<'EoF' > /root/mysql-load-table.sql
#         CREATE DATABASE poc2023;
#         USE poc2023;
#         CREATE TABLE NhanVien (PersonID INT(11), LastName VARCHAR(255), FirstName VARCHAR(255));
#         INSERT INTO NhanVien (PersonID, LastName, FirstName) VALUES ('1', 'Tran Van', ' Nhat'), ('2', 'Nguyen', 'Thanh');
#         EoF
