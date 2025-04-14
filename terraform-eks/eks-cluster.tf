module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.13.1"

  cluster_name    = "rb-cluster"
  cluster_version = "1.26"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  create_cloudwatch_log_group = false  # <-- Avoid conflict with existing log group

  # Optional: Use an existing KMS key if encryption is enabled
  # If you're not using encryption, you can omit the below block
  # cluster_encryption_config = {
  #   resources        = ["secrets"]
  #   provider_key_arn = "arn:aws:kms:ap-south-1:<your-account-id>:key/<existing-kms-key-id>"
  # }

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 1
      desired_size = 1
    }

    two = {
      name = "node-group-2"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 1
      desired_size = 1
    }
  }
}
