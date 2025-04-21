variable "eks_fargate_execution_role_name" {
  description = "The name of the IAM role for EKS Fargate execution"
  type        = string
  default     = "eks-fargate-execution-role"
}

variable "cluster_name" {
  type = string
}