resource "aws_ecs_cluster" "mycluster" {
  name = var.name
}

resource "aws_ecs_task_definition" "mytaskdef" {
  family                = var.name
  container_definitions = file("service.json")
}


resource "aws_ecs_service" "myservice" {
  name = var.name
  cluster = aws_ecs_cluster.mycluster.id
  task_definition = aws_ecs_task_definition.mytaskdef.arn
  desired_count = 3
  iam_role = aws_iam_role.myclusterrole.arn

  network_configuration {
    subnets = [aws_subnet.green.id, aws_subnet.red.id]
    assign_public_ip = false
    security_groups = [aws_security_group.myservicesg.id]
  }
}

resource "aws_security_group" "myservicesg" {
  vpc_id = aws_vpc.myvpc.id

  ingress {
    from_port = 0
    to_port   = 0
    protocol = "-1"
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.name
    Environment = var.environment
  }
}