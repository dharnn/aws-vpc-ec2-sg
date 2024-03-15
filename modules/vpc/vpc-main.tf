resource "aws_vpc" "vpc_1" {
    cidr_block = "192.168.0.0/16"
    tags = {
        Name = "VPC-1"
    }
}

resource "aws_subnet" "public_subnet"{
    vpc_id = aws_vpc.vpc_1.id
    count = 4
    cidr_block = cidrsubnet(aws_vpc.vpc_1.cidr_block, 4, count.index)
    map_public_ip_on_launch = true
    tags = {Name = "subnet-vpc1-${count.index}"}
}

resource "aws_internet_gateway" "igw-tf" {
  vpc_id = aws_vpc.vpc_1.id
  tags   = { Name = "igw-tf" }
}

resource "aws_route_table" "vpc-RT" {
  vpc_id = aws_vpc.vpc_1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-tf.id
  }
  tags = { Name = "VPC 1 RT" }
}

resource "aws_route_table_association" "vpc1-rts" {
  count = 4
  route_table_id = aws_route_table.vpc-RT.id
  subnet_id      = aws_subnet.public_subnet.*.id[count.index]
}
