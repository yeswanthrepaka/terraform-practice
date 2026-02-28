resource "aws_route53_record" "DNS" {
    for_each = var.instances
  zone_id = var.zone_id
  name    = "${each.key}-${var.environment}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.example[each.key].private_ip]
  allow_overwrite = true
}