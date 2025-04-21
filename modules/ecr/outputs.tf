output "appointment_service_ecr_url" {
  description = "The URL of the Appointment Service ECR repository"
  value       = aws_ecr_repository.appointment.repository_url
}

output "patient_service_ecr_url" {
  description = "The URL of the Patient Service ECR repository"
  value       = aws_ecr_repository.patient.repository_url
}

