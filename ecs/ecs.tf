resource "aws_ecs_cluster" "medusa" {
  name = var.cluster_name
}

resource "aws_ecs_service" "medusa" {
  name            = "medusa-service"
  cluster         = aws_ecs_cluster.medusa.id
  launch_type     = "FARGATE"
  desired_count   = 1
  platform_version = "LATEST"

  task_definition = aws_ecs_task_definition.medusa.arn

  network_configuration {
    subnets         = var.subnets
    security_groups = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.alb_target_group_arn
    container_name   = "medusa"
    container_port   = var.container_port
  }
}

resource "aws_security_group" "ecs_sg" {
  name        = "ecs-sg"
  description = "Allow inbound access from ALB"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.container_port
    to_port     = var.container_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "vpc_id" {}
variable "subnets" {
  type = list(string)
}
variable "target_port" {
  default = 9000
}

variable "cluster_name" {
  default = "medusa-cluster"
}

variable "container_image" {}

variable "container_port" {
  default = 9000
}

variable "alb_target_group_arn" {}

variable "execution_role_arn" {
  description = "IAM role ARN to use for ECS task execution"
  type        = string
}

output "cluster_name" {
  description = "The ECS Cluster name"
  value       = aws_ecs_cluster.medusa.name
}
