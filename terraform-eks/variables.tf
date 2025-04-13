variable "region" {
  description = "AWS region"
  default     = "ap-south-1"  # Or use your region
}

variable "cluster_name" {
  description = "EKS Cluster name"
  default     = "my-cluster"  # Replace with your desired cluster name
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "tf_state_bucket_name" {
  description = "Name of the S3 bucket for Terraform state"
  default     = "rb-state-bucket"  # Make sure this is unique
}

variable "tf_lock_table_name" {
  description = "Name of the DynamoDB table for state locking"
  default     = "terraform-locks"
}

