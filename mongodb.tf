resource "aws_instance" "mongodb" {
  ami           = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = ["sg-0c433bcccf94c7d36"]
  instance_type = "t3.small"

  tags = {
    Name = "mongodb"
  }
}


resource "aws_route53_record" "mongodb" {
  zone_id = "Z08573782K96CIOPZ7P6V"
  name    = "mongodb-dev"
  type    = "A"
  ttl     = 10
  records = [aws_instance.mongodb.private_ip]
}