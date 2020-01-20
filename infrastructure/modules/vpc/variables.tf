variable "ENV" {
}

variable "AWS_REGION" {
}

variable "cluster-name" {
  default = "terraform-eks-$ENV"
  type    = string
}
 
