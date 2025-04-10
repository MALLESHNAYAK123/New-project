#vpc

resource "aws_vpc" "vpc-1" {
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "mallesh-vpc"
  }
}

resource "aws_subnet" "public-subnet-1" {
  vpc_id     = aws_vpc.vpc-1.id
  cidr_block = "10.0.0.0/28"
  tags = {
    Name = "mallesh-pub-subnet-1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id     = aws_vpc.vpc-1.id
  cidr_block = "10.0.0.16/28"
  tags = {
    Name = "mallesh-pub-subnet-2"
  }
}
resource "aws_subnet" "public-subnet-3" {
  vpc_id     = aws_vpc.vpc-1.id
  cidr_block = "10.0.0.32/28"
  tags = {
    Name = "mallesh-pub-subnet-3"
  }

}
resource "aws_subnet" "public-subnet-4" {
  vpc_id     = aws_vpc.vpc-1.id
  cidr_block = "10.0.0.48/28"
  tags = {
    Name = "mallesh-pub-subnet-4"
  }

}
resource "aws_subnet" "public-subnet-5" {
  vpc_id     = aws_vpc.vpc-1.id
  cidr_block = "10.0.0.64/28"
  tags = {
    Name = "mallesh-pub-subnet-5"
  }

}
resource "aws_subnet" "public-subnet-6" {
  vpc_id     = aws_vpc.vpc-1.id
  cidr_block = "10.0.0.80/28"
  tags = {
    Name = "mallesh-pub-subnet-6"
  }

}
resource "aws_subnet" "private-subnet-1" {
  vpc_id     = aws_vpc.vpc-1.id
  cidr_block = "10.0.0.96/28"
  tags = {
    Name = "mallesh-pvt-subnet-1"
  }

}
resource "aws_subnet" "private-subnet-2" {
  vpc_id     = aws_vpc.vpc-1.id
  cidr_block = "10.0.0.112/28"
  tags = {
    Name = "mallesh-pvt-subnet-2"
  }

}
resource "aws_subnet" "private-subnet-3" {
  vpc_id     = aws_vpc.vpc-1.id
  cidr_block = "10.0.0.128/28"
  tags = {
    Name = "mallesh-pvt-subnet-3"
  }

}
resource "aws_subnet" "private-subnet-4" {
  vpc_id     = aws_vpc.vpc-1.id
  cidr_block = "10.0.0.144/28"
  tags = {
    Name = "mallesh-pvt-subnet-4"
  }

}
resource "aws_subnet" "private-subnet-5" {
  vpc_id     = aws_vpc.vpc-1.id
  cidr_block = "10.0.0.160/28"
  tags = {
    Name = "mallesh-pvt-subnet-5"
  }

}
resource "aws_subnet" "private-subnet-6" {
  vpc_id     = aws_vpc.vpc-1.id
  cidr_block = "10.0.0.176/28"
  tags = {
    Name = "mallesh-pvt-subnet-6"
  }

}


#gatways

resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.vpc-1.id
  tags = {
    Name = "mallesh-int-gateway"
  }
}

resource "aws_eip" "eip" {

}

resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public-subnet-2.id
  tags = {
    Name = "mallesh-nat-gateway"
  }
}

#routetable

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc-1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }
  tags = {
    Name = "mallesh-public-rt"
  }
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.vpc-1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gateway.id
  }
  tags = {
    Name = "mallesh-private-rt"
  }
}

#rt association

resource "aws_route_table_association" "asso-pub-sub-1" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "asso-pub-sub-2" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "asso-pub-sub-3" {
  subnet_id      = aws_subnet.public-subnet-3.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "asso-pub-sub-4" {
  subnet_id      = aws_subnet.public-subnet-4.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "asso-pub-sub-5" {
  subnet_id      = aws_subnet.public-subnet-5.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "asso-pub-sub-6" {
  subnet_id      = aws_subnet.public-subnet-6.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "asso-pvt-sub-1" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "asso-pvt-sub-2" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "asso-pvt-sub-4" {
  subnet_id      = aws_subnet.private-subnet-4.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "asso-pvt-sub-3" {
  subnet_id      = aws_subnet.private-subnet-3.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "asso-pvt-sub-5" {
  subnet_id      = aws_subnet.private-subnet-5.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "asso-pvt-sub-6" {
  subnet_id      = aws_subnet.private-subnet-6.id
  route_table_id = aws_route_table.private-rt.id
}