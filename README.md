# Damolak DevOps Challenge

Production-ready application deployment using modern DevOps practices.

## Architecture Overview
GitHub Actions CI/CD
|
v
Build and Test
|
v
Push to ECR
|
v
Deploy to EC2
|
v
Flask App (Docker) --> CloudWatch Monitoring

Components:
- Flask web application containerised with Docker
- AWS EC2 t3.micro running in a custom VPC
- AWS ECR storing Docker images
- AWS S3 for artifacts storage
- AWS CloudWatch for monitoring and alerts
- GitHub Actions for CI/CD pipeline
- Terraform for all infrastructure provisioning

## Deployment Steps

### Prerequisites
- AWS account with appropriate permissions
- Terraform installed
- GitHub account
- AWS CLI configured

### 1. Clone the repository

git clone https://github.com/ibrahim-balogun/damolak-devops-challenge.git
cd damolak-devops-challenge

### 2. Provision infrastructure

cd terraform
terraform init
terraform apply -var="key_name=your-key-name"

### 3. Add GitHub Secrets

Add these secrets to your repository settings:
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- ECR_REGISTRY
- EC2_HOST
- EC2_SSH_KEY

### 4. Push to main branch

git push origin main

The pipeline triggers automatically and deploys the application.

### 5. Access the application

http://18.201.214.189:5000
http://18.201.214.189:5000/health

## Design Decisions

Terraform was used for all infrastructure to ensure repeatability and eliminate manual provisioning steps.

Docker was used to containerise the application ensuring consistent behaviour across all environments.

GitHub Actions was chosen for CI/CD due to native GitHub integration and zero additional tooling required.

ECR was used as the container registry to keep images within the AWS ecosystem and simplify authentication.

t3.micro was selected as the instance type for cost efficiency within free tier limits.

CloudWatch was configured with CPU alarms and SNS email alerts for proactive infrastructure observability.

## Assumptions

- AWS credentials have sufficient permissions for EC2, ECR, S3, VPC, IAM and CloudWatch
- The EC2 instance is accessible on ports 22, 80 and 5000
- Pipeline runs on every push to the main branch

## Limitations and Improvements

- No HTTPS configured. A production setup would use an ALB with an ACM certificate
- Single EC2 instance with no auto scaling. Production would use an Auto Scaling Group
- AWS CLI was manually installed on EC2 after initial provisioning. A more robust solution would use a pre-baked AMI
- Secrets are stored in GitHub Secrets. Production would use AWS Secrets Manager

## Live Demo

Application: http://18.201.214.189:5000
Health Check: http://18.201.214.189:5000/health
