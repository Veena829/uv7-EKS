variable "cluster_name" {
  description = "EKS cluster name"
  default     = "my-cluster"
  type = string
}

variable "fargate_profile_name" {
  description = "Fargate profile name"
  default     = "fargate-profile"
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}
variable "vpc_id" {
  type = string
}
variable "eks_fargate_task_execution_role_arn" {
  type = string
}

variable "cluster_name" {
  type = string
}



