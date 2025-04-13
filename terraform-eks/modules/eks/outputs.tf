output "cluster_name" {
  value = aws_eks_cluster.this.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "kubeconfig" {
  value = <<EOT
aws eks update-kubeconfig --region ${var.region} --name ${aws_eks_cluster.this.name}
EOT
}
