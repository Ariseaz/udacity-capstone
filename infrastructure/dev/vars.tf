variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "cluster-name" {
  default = "terraform-eks-dev"
  type    = string
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
 