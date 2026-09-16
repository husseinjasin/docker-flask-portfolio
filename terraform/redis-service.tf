resource "aws_ecs_service" "redis" {
  name            = "docker-redis-service"
  cluster         = aws_ecs_cluster.flask.id
  task_definition = aws_ecs_task_definition.redis.arn
  desired_count   = 0

  force_new_deployment    = true
  enable_ecs_managed_tags = true

  capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = 1
    base              = 0
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  network_configuration {
    subnets          = [aws_subnet.main.id, aws_subnet.second.id]
    security_groups  = [aws_security_group.redis.id]
    assign_public_ip = true
  }

  service_connect_configuration {
    enabled   = true
    namespace = "arn:aws:servicediscovery:eu-west-2:229128716316:namespace/ns-gh5wcvmultda44qc"

    log_configuration {
      log_driver = "awslogs"

      options = {
        "awslogs-create-group"  = "true"
        "awslogs-group"         = "/ecs/docker-redis-service"
        "awslogs-region"        = "eu-west-2"
        "awslogs-stream-prefix" = "ecs"
      }
    }

    service {
      port_name      = "redis"
      discovery_name = "redis"

      client_alias {
        dns_name = "redis"
        port     = 6379
      }
    }
  }
}