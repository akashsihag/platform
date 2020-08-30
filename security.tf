resource "aws_security_group" "allow-ssh" {
  name        = "allow_ssh"
  description = "allow ssh inbound traffic"
  vpc_id      = aws_vpc.platform-vpc.id

  tags = {
    Name = "allow ssh"
  }

  ingress {
    description = "Allow all ssh traffic"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
  }

}