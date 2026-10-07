terraform {
  backend "s3" {
    bucket = "prince-my-project-sample-s3-bucket-2026"
    key    = "pipeline-1/terraform.tfstate"
    region = "ap-southeast-2"
  }
}

provider "aws" {
  region = var.aws_region
}
