variable "region" {
  description = "AWS region to deploy the infrastructure in"
  default     = "ap-south-1"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  default     = "my-cluster"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDRs for public subnets (used for NAT Gateways or Internet-facing services)"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDRs for private subnets (used for worker nodes)"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "tf_state_bucket_name" {
  description = "Name of the S3 bucket to store Terraform remote state"
  default     = "rb-state-bucket"  # Ensure this name is globally unique
}

variable "tf_lock_table_name" {
  description = "Name of the DynamoDB table used for Terraform state locking"
  default     = "terraform-locks"
}
