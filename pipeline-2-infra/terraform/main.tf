module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.4.1"

  name = "my-project-ec2-sample"

  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  monitoring    = true
  subnet_id     = var.subnet_id

  security_group_ingress_rules = {
    ssh = {
      description = "SSH"
      from_port   = 22
      to_port     = 22
      ip_protocol = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    }

    http = {
      description = "HTTP"
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Project     = "My-project-sample"
  }
}

module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "3.2.0"

  repository_name = var.ecr_repository_name

  repository_type = "private"

  repository_image_tag_mutability = "MUTABLE"

  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Keep last 30 images"
        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = 30
        }
        action = {
          type = "expire"
        }
      }
    ]
  })

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Project     = "My-project-sample"
  }
}
