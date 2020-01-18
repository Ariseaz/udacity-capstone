variable "ENV" {
}

variable "AWS_REGION" {
}

variable "cluster-name" {
  default = "terraform-eks-demo"
  type    = string
}

variable "INSTANCE_TYPE" {
  default = "t2.micro"
}

variable "PUBLIC_SUBNETS" {
  type = list
}

variable "VPC_ID" {
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
