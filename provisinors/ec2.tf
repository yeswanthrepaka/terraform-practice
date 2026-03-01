resource "aws_instance" "example" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > inventory.ini"
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [ 
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
     ]
  }

  provisioner "remote-exec" {
    inline = [ 
      "sudo systemctl stop nginx"
     ]
    when = destroy 
  }
  
  tags = {
    Name = "terraform-provisinor-demo"
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

        ingress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        }

    tags = {
        name = "terraform-allow-all"
    }
}