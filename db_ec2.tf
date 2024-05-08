resource "aws_instance" "db_server" {
  ami           = "ami-060f2cb962e997969"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id
  key_name      = "docker"

  security_groups = [aws_security_group.db_server_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install mysql-server -y
              systemctl start mysqld
              systemctl enable mysqld
              EOF

  tags = {
    Name = "DBServerInstance"
  }
}
