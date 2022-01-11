# Configure Virtual Private Cloud

resource "aws_vpc" "project9_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "project9_vpc"
  }
}


# Configure Private Subnet 1

resource "aws_subnet" "proj9_pri_sub1" {
  vpc_id            = aws_vpc.project9_vpc.id
  cidr_block        = var.pri_cidr
  availability_zone = "eu-west-1a"

  tags = {
    Name = "proj9_pri_sub1"
  }
}

# Configure Private Subnet 2

resource "aws_subnet" "proj9_pri_sub2" {
  vpc_id            = aws_vpc.project9_vpc.id
  cidr_block        = var.pri_cidr_2
  availability_zone = "eu-west-1b"

  tags = {
    Name = "proj9_pri_sub2"
  }
}


# Configure Public Subnet 1

resource "aws_subnet" "proj9_pub_sub1" {
  vpc_id            = aws_vpc.project9_vpc.id
  cidr_block        = var.pub_cidr
  availability_zone = "eu-west-1c"

  tags = {
    Name = "proj9_pub_sub1"
  }
}


# Configure Public Subnet 2

resource "aws_subnet" "proj9_pub_sub2" {
  vpc_id            = aws_vpc.project9_vpc.id
  cidr_block        = var.pub_cidr_2
  availability_zone = "eu-west-1a"

  tags = {
    Name = "proj9_pub_sub2"
  }
}

# Create Internet Gateway

resource "aws_internet_gateway" "proj9_igw" {
  vpc_id = aws_vpc.project9_vpc.id

  tags = {
    Name = "proj9_igw"
  }
}

# Configure Public Route Table 

resource "aws_route_table" "proj9_RT" {
  vpc_id = aws_vpc.project9_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.proj9_igw.id
  }

  tags = {
    Name = "proj9_RT"
  }
}

# Create Private Route Table

resource "aws_route_table" "proj9_RT_pri" {
  vpc_id = aws_vpc.project9_vpc.id

  route = []

  tags = {
    Name = "proj9_RT_pri"
  }
}

# Private Subnet 1 association to Private Route Table

resource "aws_route_table_association" "proj9_RT_pri1" {
  subnet_id      = aws_subnet.proj9_pri_sub1.id
  route_table_id = aws_route_table.proj9_RT_pri.id
}

# Private Subnet 2 association to Private Route Table

resource "aws_route_table_association" "proj9_RT_pri2" {
  subnet_id      = aws_subnet.proj9_pri_sub2.id
  route_table_id = aws_route_table.proj9_RT_pri.id
}

# Public Subnet 1 association to Public Route Table

resource "aws_route_table_association" "proj9_RT_pub1" {
  subnet_id      = aws_subnet.proj9_pub_sub1.id
  route_table_id = aws_route_table.proj9_RT.id
}

# Public Subnet 2 association to Public Route Table

resource "aws_route_table_association" "proj9_RT_pub2" {
  subnet_id      = aws_subnet.proj9_pub_sub2.id
  route_table_id = aws_route_table.proj9_RT.id
}


# Association of Internet Gateway to Public Route Table

resource "aws_route" "proj9_igw_RT" {
  route_table_id         = aws_route_table.proj9_RT.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.proj9_igw.id

}













