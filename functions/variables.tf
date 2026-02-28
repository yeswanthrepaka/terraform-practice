variable "common_tags" {
    default = {
        project = "roboshop"
        environment = "dev"
        terraform = "true"
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