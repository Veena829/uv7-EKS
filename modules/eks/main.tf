# Define the EKS Cluster
resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  role_arn = var.eks_fargate_task_execution_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

# Define the Fargate Profile
resource "aws_eks_fargate_profile" "main" {
  cluster_name           = aws_eks_cluster.main.name
  fargate_profile_name   = var.fargate_profile_name
  pod_execution_role_arn = var.eks_fargate_task_execution_role_arn
  subnet_ids             = var.subnet_ids

  selector {
    namespace = "default"
  }
}

# Fetch EKS Cluster Data
data "aws_eks_cluster" "main" {
  name = aws_eks_cluster.main.name
}

data "aws_eks_cluster_auth" "main" {
  name = aws_eks_cluster.main.name
}

# Configure Kubernetes Provider with Alias
provider "kubernetes" {
  alias                  = "eks"
  host                   = data.aws_eks_cluster.main.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.main.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.main.token
}

# Output for Debugging
output "eks_cluster_endpoint" {
  value = data.aws_eks_cluster.main.endpoint
}

output "eks_cluster_token" {
  value = data.aws_eks_cluster_auth.main.token
}

# Apply Appointment Service Deployment and Service
resource "kubernetes_manifest" "appointment_deployment" {
  provider = kubernetes.eks
  depends_on = [aws_eks_cluster.main]
  manifest   = yamldecode(file("${path.module}/kubernetes/appointment/deployment.yaml"))
}

resource "kubernetes_manifest" "appointment_service" {
  provider = kubernetes.eks
  depends_on = [aws_eks_cluster.main]
  manifest   = yamldecode(file("${path.module}/kubernetes/appointment/service.yaml"))
}

# Apply Patient Service Deployment and Service
resource "kubernetes_manifest" "patient_deployment" {
  provider = kubernetes.eks
  depends_on = [aws_eks_cluster.main]
  manifest   = yamldecode(file("${path.module}/kubernetes/patient/deployment.yaml"))
}

resource "kubernetes_manifest" "patient_service" {
  provider = kubernetes.eks
  depends_on = [aws_eks_cluster.main]
  manifest   = yamldecode(file("${path.module}/kubernetes/patient/service.yaml"))
}

# Apply Ingress for Patient Service
resource "kubernetes_manifest" "patient_ingress" {
  provider = kubernetes.eks
  depends_on = [aws_eks_cluster.main]
  manifest   = yamldecode(file("${path.module}/kubernetes/ingress.yaml"))
}
