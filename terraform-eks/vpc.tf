module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.19.0"

  # VPC Configuration
  cidr = "10.0.0.0/16"
  
  azs  = data.aws_availability_zones.available.names # Automatically selects the availability zones

  # Subnet Configuration
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

  # NAT Gateway Configuration
  enable_nat_gateway   = true
  enable_dns_hostnames = true

  # Tags for VPC and Subnets
  tags = {
    "Name" = "vpc"
  }

  subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = 1
  }

  # If you need more custom subnet tags, you can set them directly
  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = 1
  }

  # Additional options based on your requirement
  create_nat_gateway = true
  create_vpc          = true
}
