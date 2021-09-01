terraform {
  backend "s3" {
    bucket = "jh-tf-devopsthehardway"
    key    = "ecr-terraform.tfstate"
    region = "us-west-1"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-west-1"
}

resource "aws_ecr_repository" "jh-tf-ecr-repo" {
  name                 = var.repo_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}







