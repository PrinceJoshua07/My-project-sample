module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "5.16.1"

  bucket = var.bucket_name

  control_object_ownership = true
  object_ownership         = "BucketOwnerEnforced"

  versioning = {
    enabled = true
  }

  force_destroy = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Project     = "My-project-sample"
  }
}
