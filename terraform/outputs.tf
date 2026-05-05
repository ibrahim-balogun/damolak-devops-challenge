output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.app.public_ip
}

output "instance_public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.app.public_dns
}

output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.artifacts.bucket
}
