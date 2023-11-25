provider "aws" {
  region  = "us-east-1" # Choose the appropriate AWS region
  profile = "my-terraform-admin-user"
}

resource "aws_instance" "nginx_ec2" {
  ami           = "ami-0fc5d935ebf8bc3bc" # Amazon Linux 2 AMI ID for your preferred region
  instance_type = "t2.micro"              # Choose your desired EC2 instance type

  tags = {
    Name = "nginx-ec2-instance"
  }

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              service nginx start
              chkconfig nginx on
              echo "<h1>Hello from Nginx on AWS EC2!</h1>" > /usr/share/nginx/html/index.html
              EOF
}

output "public_ip" {
  value = aws_instance.nginx_ec2.public_ip
}
