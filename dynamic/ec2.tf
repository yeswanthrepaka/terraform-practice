resource "aws_instance" "example" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = "terraform"
  }
}
    
resource "aws_security_group" "allow_tls" {
name        = "terraform-allow-all"
description = "Allow TLS inbound traffic and all outbound traffic"
        egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        }

        dynamic "ingress" {
            for_each = toset(var.ingress_rules)
            content {
                from_port        = ingress.value.port
                to_port          = ingress.value.port
                protocol         = "tcp"
                cidr_blocks      = ingress.value.cidr_blocks
                ipv6_cidr_blocks = ["::/0"]
            }
        }

    tags = {
        name = "terraform-allow-all"
    }
}