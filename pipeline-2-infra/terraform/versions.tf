terraform {
  required_version = ">= 1.5.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.42"
    }
  }

  backend "s3" {
    bucket = "prince-my-project-sample-s3-bucket-2026"
    key    = "pipeline-2/terraform.tfstate"
    region = "ap-southeast-2"
  }
}
