variable "cluster-name" {
  default = "terraform-eks-demo"
  type    = string
}

variable "VPC_ID" {
}

variable "PUBLIC_SUBNETS" {
  type = list
}

