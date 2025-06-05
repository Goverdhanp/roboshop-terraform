resource "aws_instance" "instance" {
  count = length(var.instances)
  ami           = var.ami_id
  vpc_security_group_ids = var.vpc_security_group_ids
  instance_type = var.instance_type

  tags = {
    Name = var.instances[count.index]
      
  }

}

resource "aws_route53_record" "catalogue" {
  count = length(var.instances)
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}-${var.env}"
  type    = "A"
  ttl     = 10
  records = [aws_instance.instance[count.index].private_ip]
}