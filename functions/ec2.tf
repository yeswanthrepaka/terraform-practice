resource "aws_instance" "example" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = merge(
    var.common_tags,
    var.ec2_tags
  )
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

        ingress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        }

    tags = merge(
      var.common_tags,
      var.sg_tags
    )
}