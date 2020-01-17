module "main-vpc" {
  source     = "../modules/vpc"
  ENV        = "prod"
  AWS_REGION = var.AWS_REGION
}

module "instances" {
  source         = "../modules/instances"
  ENV            = "prod"
  VPC_ID         = module.main-vpc.vpc_id
  PUBLIC_SUBNETS = module.main-vpc.public_subnets
}

module "eks" {
  source         = "../modules/eks"
  ENV            = "dev"
  VPC_ID         = module.main-vpc.vpc_id
  PUBLIC_SUBNETS = module.main-vpc.private_subnets
}
