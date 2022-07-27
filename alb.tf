resource "aws_alb" "mylb" {
  name = var.name
  internal = false
  load_balancer_type = "application"
  subnets = [aws_subnet.green]
  tags = {
    Name = var.name
    Environment = var.environment
  }
}

resource "aws_security_group" "mylbsg" {
  vpc_id = aws_vpc.myvpc.id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name        = var.name
    Environment = var.environment
  }
}
