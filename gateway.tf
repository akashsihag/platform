resource "aws_internet_gateway" "igw-1" {
  vpc_id = aws_vpc.platform-vpc.id

  tags = {
    Name = "igw-1"
  }
}