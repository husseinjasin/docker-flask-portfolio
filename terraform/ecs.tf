resource "aws_ecs_cluster" "flask" {
  name = "docker-flask-cluster"

  lifecycle {
    ignore_changes = [
      configuration
    ]
  }
}    