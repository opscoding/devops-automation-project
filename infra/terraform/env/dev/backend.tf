terraform {
  backend "s3" {
    bucket = "lessandro-tf-state-file"
    key    = "devops-automation-project/dev/terraform.tfstate"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.49"
    }
  }
}