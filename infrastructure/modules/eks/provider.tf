provider "aws" {
  version = ">= 2.28.1"
  region  = var.region
}

data "aws_region" "current" {
}

data "aws_availability_zones" "available" {
}

provider "http" {
}

