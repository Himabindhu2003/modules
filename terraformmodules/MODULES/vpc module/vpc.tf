resource "aws_vpc" "vpc5" {
    cidr_block = var.ipadress
    tags = {
      name=var.vpc-name
    }
  
}


resource "aws_subnet" "subnet5" {
    vpc_id = aws_vpc.vpc5.id
    cidr_block = var.sub_ip
    tags = {
      name=var.sub-name
    }
  
}