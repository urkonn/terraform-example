data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["ecs-tasks.amazon.com"]
      type        = "Service"
    }
  }
}

resource "aws_iam_role" "myclusterrole" {
  name = var.name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

  tags = {
    Name = var.name
    Environment = var.environment
  }
}

resource "aws_iam_role_policy_attachment" "myclusterroleattchmt" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
  role       = aws_iam_role.myclusterrole.name
}
