variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-2"
}

variable "ami_id" {
  description = "Ubuntu 24.04 AMI ID"
  type        = string
  default     = "ami-0eb87ec7ecb669408"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
  default     = "mykey-1"
}

variable "subnet_id" {
  description = "Subnet ID for EC2"
  type        = string
  default     = "subnet-097879cf09f59d553"
}

variable "ecr_repository_name" {
  description = "Private ECR repository name"
  type        = string
  default     = "my-project-sample-app"
}
