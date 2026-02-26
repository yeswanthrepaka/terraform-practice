variable "ami_id" {
    default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
    default = "t3.micro"
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

variable "instance_name" {
    type = list(string)
    default = ["mongodb","catalogue"]
}

variable "environment" {
    default = "prod"
}