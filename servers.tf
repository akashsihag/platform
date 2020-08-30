resource "aws_instance" "ec2-instance-1" {
  ami           = var.ami_id
  instance_type = "t3.micro"
  key_name      = var.ami_key_pair_name

  security_groups = [
    aws_security_group.allow-ssh.id
  ]

  tags = {
    Name = var.ami_name
  }

  subnet_id = aws_subnet.subnet-prvt.id


}