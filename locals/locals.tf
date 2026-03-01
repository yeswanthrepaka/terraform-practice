locals {
  common_tags = {
        Name = "${var.ec2_tags}-${var.environment}"
        Project = "roboshop"
        Terraform = "true"
        Environment = var.environment
  }

  # ec2_final_tags = merge(var.ec2_tags, local.common_tags)
}