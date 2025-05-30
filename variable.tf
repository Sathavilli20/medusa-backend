variable "container_image" {
  description = "The Medusa container image to use"
  type        = string
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
  default     = 9000
}

variable "vpc_id" {
  description = "The VPC ID to associate with resources"
  type        = string
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "subnets" {
  description = "List of subnet IDs for the load balancer"
  type        = list(string)
}
