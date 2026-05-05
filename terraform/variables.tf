variable "aws_region" {
  description = "AWS region"
  default     = "eu-west-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "app_port" {
  description = "Application port"
  default     = 5000
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}
