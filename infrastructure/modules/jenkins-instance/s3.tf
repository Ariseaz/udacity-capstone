resource "aws_s3_bucket" "terraform-state" {
  bucket = "terraforms3az"
  acl    = "private"

  tags = {
    Name = "Terraform state"
  }
}

