resource "aws_instance" "instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_id = var.vpc_security_group_id
  

  tags = {
    name = var.name
      
  }

}

resource "aws_route53_record" "record" {
  for_each= var.instance
  zone_id = var.zone_id
  name    = "${var.name}-${var.env}"
  type    = "A"
  ttl     = 10
  records = [aws_instance.instance.private_ip]
}

 