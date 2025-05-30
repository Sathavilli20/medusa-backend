output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.medusa.dns_name
}

output "ecr_repository_url" {
  description = "URL of the ECR repository"
  value       = module.ecr.repository_url
}

output "cluster_name" {
  description = "The ECS Cluster name"
  value       = module.ecs.cluster_name
}
