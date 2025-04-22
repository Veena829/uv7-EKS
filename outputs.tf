# modules/eks/outputs.tf
output "cluster_name" {
  value = aws_eks_cluster.main.name
}

output "cluster_id" {
  value = aws_eks_cluster.main.id
}

output "cluster_endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "cluster_security_group_id" {
  value = aws_eks_cluster.main.cluster_security_group_id
}
