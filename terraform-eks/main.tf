#provider "aws" {
#  region = var.region
#}

module "eks" {
  source               = "./modules/eks"
  region               = var.region
  cluster_name         = var.cluster_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

#resource "aws_s3_bucket" "terraform_state" {
#  bucket = var.tf_state_bucket_name
#
# versioning {
#    enabled = true
#  }
#
#  server_side_encryption_configuration {
#    rule {
#      apply_server_side_encryption_by_default {
#        sse_algorithm = "AES256"
#      }
#    }
#  }
#
#  tags = {
#  #  Name = "Terraform State Bucket"
#  }
#}

#resource "aws_dynamodb_table" "terraform_locks" {
#  name         = var.tf_lock_table_name
#  billing_mode = "PAY_PER_REQUEST"
#  hash_key     = "LockID"
#
#  attribute {
#    name = "LockID"
#    type = "S"
#  }
#
#  tags = {
#    Name = "Terraform Lock Table"
#  }
#}
