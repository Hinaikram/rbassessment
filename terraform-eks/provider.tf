provider "aws" {
  region = "me-south-1"
  access_key = "AKIA2NK3YPFZBPDXX5OU"
  secret_key = "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
"
  profile= "default"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}