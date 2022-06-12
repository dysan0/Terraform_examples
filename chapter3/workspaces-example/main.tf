#init command - terraform init -backend-config=backend.hcl
terraform {
  required_version = ">= 1.0.0, < 2.0.0"
  

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    key = "workspaces-example/terraform.tfstate"
	}

}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}