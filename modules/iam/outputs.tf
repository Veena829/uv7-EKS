output "eks_fargate_execution_role_arn" {
  description = "The ARN of the IAM role for EKS Fargate execution"
  value       = aws_iam_role.eks_fargate_execution_role.arn
}

