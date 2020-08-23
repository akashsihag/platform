resource "aws_vpc" "platform-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "platform-vpc"
  }
}

resource "aws_subnet" "subnet-prvt" {
  cidr_block = "${cidrsubnet(aws_vpc.platform-vpc.cidr_block, 3, 1)}"
  vpc_id = aws_vpc.platform-vpc.id
  availability_zone = "ap-south-1a"
}