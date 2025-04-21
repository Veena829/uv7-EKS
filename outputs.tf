output "eks_cluster_name" {
  description = "EKS Cluster Name"
  value       = module.eks.cluster_name
}

output "eks_endpoint" {
  description = "EKS Cluster API Endpoint"
  value       = module.eks.cluster_endpoint
}

output "appointment_service_ecr_url" {
  description = "Appointment Service ECR URL"
  value       = module.ecr.appointment_service_ecr_url
}

output "patient_service_ecr_url" {
  description = "Patient Service ECR URL"
  value       = module.ecr.patient_service_ecr_url
}

