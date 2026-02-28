variable "ami_id" {
    default = "ami-0220d79f3f480ecf5"
}

variable "environment" {
    default = "dev"
}

variable "sg_name" {
    default = "allow-all-terraform"
}

variable "common_tags" {
    default = {
        Project = "Roboshop"
        terraform = "true"
        environment = "dev"
    }
}
variable "ec2_tags" {
    default = {
        Name = "terraform"
    }
}

variable "sg_tags" {
    default = {
        name = "allow-all-terraform"
    }
}

variable "instances" {
    default = {
        mongodb = "t3.micro"
        mysql = "t3.small"
    }
}

variable "zone_id" {
    default = "Z0043659BDU9NVUF44DT"
}

variable "domain_name" {
    default = "repaka.online"
}