terraform {
  backend "s3" {
    bucket = "terraforms3az"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}
