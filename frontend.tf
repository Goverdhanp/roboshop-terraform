resource "aws_instance" "frontned" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"

  tags = {
    Name = "frontend"
  }
}