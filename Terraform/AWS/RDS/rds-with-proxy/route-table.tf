# Create a route table 
resource "aws_route_table" "rds_route_table" {
  vpc_id = aws_vpc.rds_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.rds_igw.id
  }

  tags = {
    Name = "${var.rds_cluster_name}-route-table"
  }
}

# Use the created route table above with the created VPC instead of the default one that comes with the VPC
resource "aws_main_route_table_association" "test_main_route_table_association" {
  vpc_id         = aws_vpc.rds_vpc.id
  route_table_id = aws_route_table.rds_route_table.id
}

# Associate Subnet A to the route table 
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.rds_subnet_a.id
  route_table_id = aws_route_table.rds_route_table.id
}

# Associate Subnet B to the route table 
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.rds_subnet_b.id
  route_table_id = aws_route_table.rds_route_table.id
}

# Associate Subnet C to the route table 
resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.ec2_subnet_c.id
  route_table_id = aws_route_table.rds_route_table.id
}
