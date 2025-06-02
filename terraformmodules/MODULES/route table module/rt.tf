resource "aws_route_table" "rt" {
    vpc_id=var.vpc-id

    route {
        gateway_id = var.gateway-id
        cidr_block = var.ipadress
    }
  tags = {
    name=var.rt-name
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = var.sub_id
  route_table_id = aws_route_table.rt.id
}