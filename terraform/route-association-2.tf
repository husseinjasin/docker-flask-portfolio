resource "aws_route_table_association" "second" {
  subnet_id      = aws_subnet.second.id
  route_table_id = aws_route_table.main.id

}