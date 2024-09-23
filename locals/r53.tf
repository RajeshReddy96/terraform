resource "aws_route53_record" "expense" {
  count   = length(var.instance_names)
  zone_id = local.zone_id
  #backend.rrajesh.online
  name = var.instance_names[count.index] == "frontend" ? local.domain_name : "${var.instance_names[count.index]}.${local.domain_name}"
  type = "A"
  ttl  = 1
  # here in records if it is frontend it is public_ip or else it is private_ip
  records         = var.instance_names[count.index] == "frontend" ? [aws_instance.terraform[count.index].public_ip] : [aws_instance.terraform[count.index].private_ip]
  allow_overwrite = true
}