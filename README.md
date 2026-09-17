# Multi-Container Flask & Redis Application

A containerised Flask web application connected to Redis, built to practise Docker, CI/CD and AWS deployment.

## Architecture

Flask → Redis

The application runs as separate containers connected through Docker networking.

## Technologies

- Python / Flask
- Redis
- Docker
- Docker Compose
- GitHub Actions
- Amazon ECR
- AWS ECS / Fargate
- AWS CloudWatch
- Terraform

## Features

- Multi-container application using Docker Compose
- Flask application connected to Redis
- Persistent Redis data using Docker volumes
- Environment variable configuration
- Container health checks
- Automated tests with pytest
- CI pipeline using GitHub Actions
- Docker image stored in Amazon ECR
- AWS ECS/Fargate deployment
- AWS infrastructure managed with Terraform

## Running Locally

Clone the repository:

git clone https://github.com/husseinjasin/docker-flask-portfolio.git
cd docker-flask-portfolio

Start the application:

docker compose up --build

Open:

http://localhost:5000

To stop the application:

docker compose down
Terraform

The terraform/ directory contains the Terraform configuration used to manage the AWS infrastructure for the project.

Before using Terraform, configure your AWS credentials and review the configuration carefully.

cd terraform
terraform init
terraform plan
Project Purpose

This project was built as a hands-on learning project to develop practical experience with containerisation, CI/CD, AWS and Infrastructure as Code.

