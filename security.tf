resource "aws_security_group" "app_server_sg" {
  name        = "AppServerSG"
  description = "Security group for the application server"

  vpc_id = aws_vpc.my_vpc.id

  # Inbound rule for SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}





resource "aws_security_group" "db_server_sg" {
  name        = "DBServerSG"
  description = "Security group for the database server"

  vpc_id = aws_vpc.my_vpc.id

  # Inbound rule allowing MySQL traffic from the application server
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.app_server_sg.id]
  }

  # Outbound rule allowing all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
