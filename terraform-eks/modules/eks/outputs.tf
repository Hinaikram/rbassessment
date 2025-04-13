output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.this.name
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = aws_eks_cluster.this.endpoint
}

output "kubeconfig" {
  description = "Command to configure kubectl"
  value = <<EOT
aws eks update-kubeconfig --region ${var.region} --name ${aws_eks_cluster.this.name}
EOT
}

output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = aws_subnet.private[*].id
}

output "node_group_name" {
  description = "Name of the EKS node group"
  value       = aws_eks_node_group.private.node_group_name
}
