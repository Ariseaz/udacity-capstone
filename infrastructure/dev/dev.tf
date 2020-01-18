module "modules" {
  source     = "../modules"
  ENV        = "dev"
  AWS_REGION = var.AWS_REGION
  VPC_ID         = module.main-vpc.vpc_id
  PUBLIC_SUBNETS = module.main-vpc.public_subnets
}
