resource "aws_ecs_task_definition" "flask" {
  family                   = "docker-flask-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"

  cpu    = "256"
  memory = "512"

  skip_destroy = true

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  execution_role_arn = aws_iam_role.ecs_execution.arn

  container_definitions = jsonencode([
    {
      name  = "flask-web"
      image = "${aws_ecr_repository.flask.repository_url}@sha256:acc13b3ea18d0e8fccd608eca2e95013823fcb2f3225c4ba22dc6c3fb6be4058"

      essential = true

      portMappings = [
        {
          name          = "flask-web-5000-tcp"
          containerPort = 5000
          hostPort      = 5000
          protocol      = "tcp"
          appProtocol   = "http"
        }
      ]

      environment = [
        {
          name  = "REDIS_HOST"
          value = "redis"
        },
        {
          name  = "REDIS_PORT"
          value = "6379"
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"

        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.flask.name
          "awslogs-region"        = "eu-west-2"
          "awslogs-stream-prefix" = "ecs"
          "awslogs-create-group"  = "true"
        }
      }
    }
  ])
}