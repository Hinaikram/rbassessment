output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "kubeconfig" {
  value = module.eks.kubeconfig
}
# Output for public subnet IDs
output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

# Output for private subnet IDs
output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}
