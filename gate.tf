
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.vpc-tf.id
  tags = {
    Name = "my-igw"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc-tf.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = {
    Name = "my-public-route-table"
  }
}
resource "aws_route_table_association" "public_route_association" {
  subnet_id      = aws_subnet.subnet-public.id
  route_table_id = aws_route_table.public_route_table.id

}

resource "aws_eip" "runnerippublico" {
  domain = "vpc"

  instance                  = aws_instance.runnerhost.id
  associate_with_private_ip = aws_instance.runnerhost.private_ip

}

# Recursos Nat Gateway

resource "aws_network_acl" "public_network_acl" {
  vpc_id = aws_vpc.vpc-tf.id

  subnet_ids = [aws_subnet.subnet-public.id]
  tags = {
    Name = "public-network-acl"
  }
}


