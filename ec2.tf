resource "aws_instance" "deepu_instance" {
    ami = var.ami
    instance_type = var.instance_type
    count = 1
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    subnet_id = aws_subnet.public_subnet-2a.id
    user_data = base64encode(file("user_data.sh"))

}

resource "aws_instance" "shivansh_instance" {
    ami = var.ami
    instance_type = var.instance_type
    count = 1
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    subnet_id = aws_subnet.public_subnet-2b.id
    user_data = base64encode(file("user_data1.sh"))

}
