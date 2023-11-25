terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.26.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region  = "us-east-1"
  profile = "my-terraform-admin-user"
}

resource "aws_iam_user" "my-user" {
  name = "Samson-user"
  path = "/system/"
}