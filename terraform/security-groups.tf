resource "aws_security_group" "flask" {
  vpc_id = aws_vpc.main.id
}

resource "aws_vpc_security_group_ingress_rule" "flask" {
  security_group_id = aws_security_group.flask.id
  ip_protocol       = "tcp"
  from_port         = 5000
  to_port           = 5000
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_security_group" "redis" {
  vpc_id = aws_vpc.main.id
}

resource "aws_vpc_security_group_egress_rule" "flask" {

  security_group_id = aws_security_group.flask.id

  ip_protocol = "-1"

  cidr_ipv4 = "0.0.0.0/0"

}

resource "aws_vpc_security_group_ingress_rule" "redis" {
  security_group_id            = aws_security_group.redis.id
  ip_protocol                  = "tcp"
  from_port                    = 6379
  to_port                      = 6379
  referenced_security_group_id = aws_security_group.flask.id

}

resource "aws_vpc_security_group_egress_rule" "redis" {

  security_group_id = aws_security_group.redis.id

  ip_protocol = "-1"

  cidr_ipv4 = "0.0.0.0/0"

}
