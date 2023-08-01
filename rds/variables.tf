variable "identifier" {
    type = string
}

variable "instance_class" {
    type = string
}

variable "allocated_storage" {
    type = number
}

variable "engine" {
    type = string
}

variable "engine_version" {
    type = string
}

variable "username" {
    type = string
}

variable "password" {
    type = string
}

variable "subnet_id" {
    type = list(string)
    description = "Subnet ID of the EC2 instance"
}

variable "vpc_id" {
    type = string
    description = "Subnet ID of the EC2 instance"
}
