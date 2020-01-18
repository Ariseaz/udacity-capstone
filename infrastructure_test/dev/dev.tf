module "eks" {
  source     = "../modules/eks"
}

module "instances" {
  source         = "../modules/instances"
  ENV            = "dev"
  VPC_ID         = module.main-vpc.vpc_id
  PUBLIC_SUBNETS = module.main-vpc.public_subnets
}

module "eks" {
  source         = "../modules/eks" 
}

