# AWS Region for the ECR repository (can be provided by the parent)
variable "aws_region" {
  description = "The AWS region to create the ECR repositories"
  type        = string
}

# ECR Repository Names (if needed)
variable "appointment_service_name" {
  description = "The name for the appointment service repository"
  type        = string
  default     = "appointment-service"
}

variable "patient_service_name" {
  description = "The name for the patient service repository"
  type        = string
  default     = "patient-service"
}

