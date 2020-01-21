resource "aws_s3_bucket" "terraform-state" {
  bucket = "terraforms-cluster-dev"
  acl    = "private"

  tags = {
    Name = "Terraform state"
  }
}

