resource "aws_instance" "instance" {
  count = length(var.instances)
  ami           = var.ami_id
  vpc_security_group_ids = var.vpc_security_group_ids
  instance_type = var.instance_type

  tags = {
    Name = var.instances[count.index]
      
  }

}

<<<<<<< HEAD
=======

>>>>>>> 2bfef8fa1b0c004a47c28537a11f136c22426c6f
resource "aws_route53_record" "catalogue" {
  count = length(var.instances)
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}-${var.env}"
  type    = "A"
  ttl     = 10
  records = [aws_instance.instance[count.index].private_ip]
}
<<<<<<< HEAD
=======

resource "null_resource" "catalogue" {
    
  provisioner "remote-exec" {
    connection {
        type     = "ssh"
        user     = "ec2-user"
        password = "DevOps321"
        host     = aws_instance.catalogue.private_ip
    }

    inline = [
      "pip3.11 install ansible",
      "ansible-pull -i localhost, -U https://github.com/Goverdhanp/roboshop-ansible.git roboshop.yml -e component_name=catalogue -e env=dev",
    ]
  }

}
>>>>>>> 2bfef8fa1b0c004a47c28537a11f136c22426c6f
