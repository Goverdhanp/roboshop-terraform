resource "aws_instance" "instances" {
  for_each = var.instances
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  

  tags = {
    Name = var.instances[each.key]
      
  }

}

resource "aws_route53_record" "catalogue" {
  for_each= var.instances
  zone_id = var.zone_id
  name    = "${var.instances[each.key]}-${var.env}"
  type    = "A"
  ttl     = 10
  records = [aws_instance.instances[each.key].private_ip]
}

 