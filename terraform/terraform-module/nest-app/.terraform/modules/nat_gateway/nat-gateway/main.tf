# Elastic IP for NAT gateway
resource "aws_eip" "eip1" {
  domain = "vpc"

  tags = {
    Name = "${var.environment}-eip-1"
  }
}


# Resources created inside the VPC are now coming from the VPC's outputs.tf
# NAT gateway created in public subnet for resources in private subnet to have internet access
resource "aws_nat_gateway" "nat_gateway_az1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = var.public_subnet_az1_id

  tags = {
    Name = "${var.environment}-nat-gateway-az1"
  }
  

# Since we already exported, we can use the output variable for internet gateway as a dependency to ensure that the NAT gateway is created after the internet gateway
  depends_on = [var.internet_gateway]
}

# Private route table - routes traffic through NAT gateway
resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_id

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
  subnet_id      = var.private_app_subnet_az1_id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_app_subnet_az2_rt_association" {
  subnet_id      = var.private_app_subnet_az2_id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_data_subnet_az1_rt_association" {
  subnet_id      = var.private_data_subnet_az1_id
  route_table_id = aws_route_table.private_route_table.id
}



resource "aws_route_table_association" "private_data_subnet_az2_rt_association" {
  subnet_id      = var.private_data_subnet_az2_id
  route_table_id = aws_route_table.private_route_table.id
} 