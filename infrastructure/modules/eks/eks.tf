variable "ENV" {
}

data "aws_eks_cluster" "cluster" {
  name = module.my-cluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.my-cluster.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  version                = "~> 1.9"
}

module "my-cluster" {
  source              = "terraform-aws-modules/eks/aws"
  cluster_name        = "my-cluster"
  cluster_version     = "1.14"
  subnets             = "${var.PRIVATE_SUBNETS}"
  vpc_id              = "${var.VPC_ID}"
  security_group_ids  = [aws_security_group.demo-cluster.id]
  
  tags = {
    Name         = "my-cluster-${var.ENV}"
    Environmnent = var.ENV
  }

  
}
