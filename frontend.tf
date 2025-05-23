resource "aws_instance" "frontned" {
  ami           = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = ["sg-0c433bcccf94c7d36"]
  instance_type = "t3.small"

  tags = {
    Name = "frontend"
  }
}