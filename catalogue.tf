resource "aws_instance" "catalogue" {
  ami           = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = ["sg-0c433bcccf94c7d36"]
  instance_type = "t3.small"

  tags = {
    Name = "catalogue"
  }

}





resource "aws_route53_record" "catalogue" {
  zone_id = "Z08573782K96CIOPZ7P6V"
  name    = "catalogue-dev"
  type    = "A"
  ttl     = 10
  records = [aws_instance.catalogue.private_ip]
}

resource "null_resource" "catalogue" {
    
  provisioner "remote-exec" {
    connection {
        type     = "ssh"
        user     = "ec2-user"
        password = "DevOps321"
        host     = self.public_ip
    }

    inline = [
      "pip3.11 install ansible",
      "ansible-pull -i localhost, -U https://github.com/Goverdhanp/roboshop-ansible.git roboshop.yml -e component_name=catalogue -e env=dev",
    ]
  }

}