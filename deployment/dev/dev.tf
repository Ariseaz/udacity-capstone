module "vpc" {
  source     = "../modules/vpc"
  ENV        = "dev"
  AWS_REGION = var.AWS_REGION
}

module "eks" {
  source         = "../modules/eks"
  ENV            = "dev" 
}

