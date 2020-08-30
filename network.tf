resource "aws_vpc" "platform-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "platform-vpc"
  }
}

resource "aws_subnet" "subnet-prvt" {
  cidr_block        = cidrsubnet(aws_vpc.platform-vpc.cidr_block, 3, 1)
  vpc_id            = aws_vpc.platform-vpc.id
  availability_zone = "ap-south-1a"
}

resource "aws_route_table" "route-table-1" {
  vpc_id = aws_vpc.platform-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-1.id
  }

  tags = {
    Name = "route-table-1"
  }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.subnet-prvt.id
  route_table_id = aws_route_table.route-table-1.id

}

resource "aws_eip" "ip-1" {
  instance = aws_instance.ec2-instance-1.id
  vpc      = true
}