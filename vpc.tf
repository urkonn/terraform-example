resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main"
    Environment = var.environment
  }
}

resource "aws_subnet" "green" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "red" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"
}
