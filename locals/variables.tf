variable "ami_id" {
    default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
    default = "t3.small"
}

variable "sg_name" {
    default = "terraform-allow-all"
}

variable "sg_description" {
    default = "Allow TLS inbound traffic and all outbound traffic"
}

variable "from_port" {
    default = "0"
}

variable "to_port" {
    default = "0"
}

variable "cidr_blocks" {
    default = ["0.0.0.0/0"]
}

variable "environment" {
    default = "dev"
}

variable "ec2_tags" {
    type = string
    default = "locals-demo"
}

variable "sg_tags" {
    default = {
        Name = "allow-all-terraform"
        Project = "roboshop"
        Terraform = "true"
        Environment = "dev"
    }
}