resource "aws_cloudwatch_log_group" "flask" {
  name = "/ecs/docker-flask-task"

}