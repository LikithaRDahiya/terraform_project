resource "aws_instance" "app_server" {
  ami           = "ami-060f2cb962e997969"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  key_name = "docker"

  security_groups = [aws_security_group.app_server_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install nginx -y
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "AppServerInstance"
  }
}
