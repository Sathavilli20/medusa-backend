resource "aws_ecr_repository" "medusa" {
  name                 = "medusa-backend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "medusa-ecr"
  }
}

output "repository_url" {
  description = "ECR repository URL"
  value       = aws_ecr_repository.medusa.repository_url
}

output "image_url" {
  description = "Image URL including tag"
  value       = "${aws_ecr_repository.medusa.repository_url}:latest"
}
