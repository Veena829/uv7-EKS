provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "iam" {
  source         = "./modules/iam"
  cluster_name   = var.cluster_name
}

module "eks" {
  source = "./modules/eks"

  cluster_name = var.cluster_name
  subnet_ids   = [
    module.vpc.private_subnet_1_id,
    module.vpc.private_subnet_2_id
  ]
  vpc_id                              = module.vpc.vpc_id  # ✅ Required!
  eks_fargate_task_execution_role_arn = module.iam.eks_fargate_execution_role_arn
  fargate_profile_name                = var.fargate_profile_name
}


module "ecr" {
  source     = "./modules/ecr"
  aws_region = var.aws_region  # ✅ Add this
}
