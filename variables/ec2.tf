resource "aws_instance" "example" {
    count = 2
  ami           = var.ami_id
  instance_type = var.environment == "dev" ? "t3.small" : "t3.small"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = var.instance_name[count.index]
  }
}
    
resource "aws_security_group" "allow_tls" {
name        = var.sg_name
description = var.sg_description
        egress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
        }

        ingress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
        }

    tags = {
        name = "terraform-allow-all"
    }
}