provider "kubernetes" {
  alias                  = "eks"
  host                   = data.aws_eks_cluster.main.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.main.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.main.token
}

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

resource "kubernetes_manifest" "patient_ingress" {
  provider = kubernetes.eks
  depends_on = [aws_eks_cluster.main]
  manifest   = yamldecode(file("${path.module}/kubernetes/ingress.yaml"))
}
