resource "aws_s3_bucket" "terraform-state" {
  bucket = "terraforms-cluster"
  acl    = "private"

  tags = {
    Name = "Terraform state"
  }
}

