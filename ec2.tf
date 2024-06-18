resource "aws_instance" "deepu_instance" {
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    subnet_id = aws_subnet.public_subnet-2a.id
    user_data = base64encode(file("userdata.sh"))

}


resource "aws_instance" "shivansh_instance" {
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    subnet_id = aws_subnet.public_subnet-2b.id
    user_data = base64encode(file("userdata1.sh"))

}
