resource "aws_iam_role" "eks_fargate_execution_role" {
  name = var.eks_fargate_execution_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "eks-fargate-pods.amazonaws.com"
      }
    }]
  })

  tags = {
    Name = var.eks_fargate_execution_role_name
  }
}

resource "aws_iam_role_policy_attachment" "eks_fargate_execution_role_policy" {
  role       = aws_iam_role.eks_fargate_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
}

