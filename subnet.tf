resource "aws_subnet" "public_subnet-2a" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.aws_subnet_public_2a
    availability_zone = var.availability_zone_public_2a
    map_public_ip_on_launch = true

  
}


resource "aws_subnet" "public_subnet-2b" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.aws_subnet_public_2b
    availability_zone = var.availability_zone_public_2b
    map_public_ip_on_launch = true

}

resource "aws_subnet" "private_subnet-2a" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.aws_subnet_private_2a
    availability_zone = var.availability_zone_private_2a
  
}

resource "aws_subnet" "private_subnet_2b" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.aws_subnet_private_2b
  availability_zone = var.availability_zone_private_2b
}