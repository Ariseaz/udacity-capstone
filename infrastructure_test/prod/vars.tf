variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "cluster-name" {
  default = "terraform-eks-demo"
  type    = string
}

variable "VPC_ID" {
}

variable "PUBLIC_SUBNETS" {
  type = list
}
