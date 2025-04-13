# VPC Declaration
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "main-vpc"
  }
}
# VPC Declaration
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "main-vpc"
  }
}

# Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidrs[0]  # Reference from the variable
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet"
  }
}

# Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_cidrs[0]  # Reference from the variable
  availability_zone       = "${var.region}b"

  tags = {
    Name = "Private Subnet"
  }
}

# EKS module
module "eks" {
  source               = "./modules/eks"
  region               = var.region
  cluster_name         = var.cluster_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

# Creating an Internet Gateway for Public Subnet Connectivity
resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.main.id
}

# Public Subnet Route Table with a Route to the Internet Gateway
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route" "internet_gateway_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.public.id
}

# Associating the Public Route Table to the Public Subnet
resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

# Example EC2 Instance (Ensure it uses Public Subnet)
resource "aws_instance" "example" {
  ami           = "ami-0e35ddab05955cf57"
  instance_type = "t2.micro"       # Update with your desired instance type
  subnet_id     = aws_subnet.public_subnet.id # Place instance in public subnet

  associate_public_ip_address = true  # Ensure EC2 has public IP

  tags = {
    Name = "Example Instance"
  }

  security_groups = [aws_security_group.sg.id]
}

# Security Group allowing SSH (port 22) and HTTP (port 8080) from specific IPs
resource "aws_security_group" "sg" {
  name        = "allow_ssh_and_http"
  description = "Allow SSH and HTTP access"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow from any IP or restrict to your IP
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow from any IP or restrict to your IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EKS module
module "eks" {
  source               = "./modules/eks"
  region               = var.region
  cluster_name         = var.cluster_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

# Creating an Internet Gateway for Public Subnet Connectivity
resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.main.id
}

# Public Subnet Route Table with a Route to the Internet Gateway
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route" "internet_gateway_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.public.id
}

# Associating the Public Route Table to the Public Subnet
resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

# Example EC2 Instance (Ensure it uses Public Subnet)
resource "aws_instance" "example" {
  ami           = "ami-0e35ddab05955cf57"
  instance_type = "t2.micro"       # Update with your desired instance type
  subnet_id     = aws_subnet.public_subnet.id # Place instance in public subnet

  associate_public_ip_address = true  # Ensure EC2 has public IP

  tags = {
    Name = "Example Instance"
  }

  security_groups = [aws_security_group.sg.id]
}

# Security Group allowing SSH (port 22) and HTTP (port 8080) from specific IPs
resource "aws_security_group" "sg" {
  name        = "allow_ssh_and_http"
  description = "Allow SSH and HTTP access"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow from any IP or restrict to your IP
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow from any IP or restrict to your IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
