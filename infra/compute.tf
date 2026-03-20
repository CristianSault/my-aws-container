resource "aws_instance" "xpix-app-server" {
    ami = var.ami_id
    associate_public_ip_address = true
    availability_zone = "us-east-1a"
    iam_instance_profile = var.instance_profile_name
    instance_type = "t3.micro"
    key_name = "Sz8w3KJ7XxUNuE"
    subnet_id = aws_subnet.public1.id
    vpc_security_group_ids = [ aws_security_group.xpix-app-server.id ]
    user_data = file("${path.module}/user_data.sh")

    tags = {
      Name = "xpix-app-server"
    }
}

import {
  id = "i-0d5bc1e370ba34e43"
  to = aws_instance.xpix-app-server
}
