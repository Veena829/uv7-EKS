variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-1"
}

variable "vpc_cidr" {
  description = "VPC CIDR range"
  type        = string
  default     = "10.0.0.0/16"
}

variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
  default     = "my-healthcare-eks"
}

variable "fargate_profile_name" {
  description = "Fargate profile name"
  type        = string
  default     = "default-fargate"
}
