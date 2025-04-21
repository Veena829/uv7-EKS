resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  role_arn = module.iam.eks_fargate_task_execution_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

resource "aws_eks_fargate_profile" "main" {
  cluster_name           = aws_eks_cluster.main.name
  fargate_profile_name   = var.fargate_profile_name
  pod_execution_role_arn = module.iam.eks_fargate_task_execution_role_arn
  subnet_ids             = var.subnet_ids

  selector {
    namespace = "default"
  }
}
