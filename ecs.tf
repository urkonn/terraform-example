resource "aws_ecs_cluster" "mycluster" {
  name = var.name
}

resource "aws_ecs_task_definition" "mytaskdef" {
  family                = var.name
  container_definitions = file("service.json")
}
