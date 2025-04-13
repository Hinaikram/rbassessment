provider "aws" {
<<<<<<< HEAD
  region = "me-south-1"
  access_key = "AKIA2NK3YPFZBPDXX5OU"
  secret_key = "mTkr7NUMxLdZ4c0vcqagXcR+fHu9XJn9txClvJgb
"
  profile= "default"
=======
  region     = "me-south-1"
  access_key = "AKIA2NK3YPFZBPDXX5OU"  # Replace with your actual AWS access key
  secret_key = "mTkr7NUMxLdZ4c0vcqagXcR+fHu9XJn9txClvJgb"  # Replace with your actual AWS secret key
>>>>>>> f116b3770a493e26e34af4f6199de202b8a19b1d
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
