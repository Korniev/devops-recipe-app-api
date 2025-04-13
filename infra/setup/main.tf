terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.0"
    }
  }

  backend "s3" {
    bucket         = "devops-udemy-recipe-app"
    key            = "tf-state-setup"
    region         = "eu-west-3"
    encrypt        = true
    dynamodb_table = "devops-udemy-recipe-app-lock"
  }
}

provider "aws" {
  region = "eu-west-3"

  default_tags {
    tags = {
      Environment = terraform.workspace
      Project     = var.project
      contact     = var.contact
      ManageBy    = "Terraform/setup"
    }
  }

}
