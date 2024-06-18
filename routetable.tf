resource "aws_route_table" "Rt1-public" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "Rt1-public-routetable"
    }
  
}
              
resource "aws_route_table_association" "public-rta1" {
    subnet_id = aws_subnet.public_subnet-2a.id
    route_table_id = aws_route_table.Rt1-public.id        
  
}

  
resource "aws_route_table" "Rt2-public" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id

    }
    tags = {
       Name = "Rt2-public-routetable"
    }
}

resource "aws_route_table_association" "public-rta2" {
    subnet_id = aws_subnet.public_subnet-2b.id
    route_table_id = aws_route_table.Rt2-public.id 
  
}

resource "aws_route_table" "private_rta1" {
    vpc_id = aws_vpc.main.id

    tags = {
      Name = "Rt1-private-routetable"
    }
  
}

resource "aws_route_table_association" "rta1-private" {
    subnet_id = aws_subnet.private_subnet-2a.id
    route_table_id = aws_route_table.private_rta1.id
  
}

resource "aws_route_table" "private_rta2" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "Rt2-private-routetable"
  }

}
 
resource "aws_route_table_association" "rta2-private" {
    subnet_id = aws_subnet.private_subnet_2b.id
    route_table_id = aws_route_table.private_rta2.id

}