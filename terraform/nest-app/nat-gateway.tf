# Elastic IP for NAT gateway
resource "aws_eip" "eip1" {
  domain = "vpc"

  tags = {
    Name = "${var.environment}-eip-1"
  }
}

# NAT gateway created in public subnet for resources in private subnet to have internet access
resource "aws_nat_gateway" "nat_gateway_az1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = aws_subnet.public_subnet_az1.id

  tags = {
    Name = "${var.environment}-nat-gateway-az1"
  }
  

  # Since NAT Gateway depends on the Internet Gateway to actually reach the internet
  # Ensure Internet Gateway is created before the NAT Gateway
  depends_on = [aws_internet_gateway.internet_gateway]
}

# Private route table - routes traffic through NAT gateway
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_az1.id
  }

  tags = {
    Name = "${var.environment}-private-route-table"

  }
}

# Associate private subnets with private route table
resource "aws_route_table_association" "private_app_subnet_az1_rt_association" {
  subnet_id      = aws_subnet.private_app_subnet_az1.id
  route_table_id = aws_route_table.private_route_table.id
}


resource "aws_route_table_association" "private_app_subnet_az2_rt_association" {
  subnet_id      = aws_subnet.private_app_subnet_az2.id
  route_table_id = aws_route_table.private_route_table.id
}


resource "aws_route_table_association" "private_data_subnet_az1_rt_association" {
  subnet_id      = aws_subnet.private_data_subnet_az1.id
  route_table_id = aws_route_table.private_route_table.id
}



resource "aws_route_table_association" "private_data_subnet_az2_rt_association" {
  subnet_id      = aws_subnet.private_data_subnet_az2.id
  route_table_id = aws_route_table.private_route_table.id
} 