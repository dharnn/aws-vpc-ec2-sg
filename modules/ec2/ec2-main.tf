resource "aws_instance" "docker" {
    ami = var.ami_id
    instance_type = var.instance_type
#    subnet_id = var.public_subnet_id.id
    count = 4
    key_name = "Keyvm1"
    vpc_security_group_ids = [var.security_group_id]
    tags = {
        Name = "Docker Container"
    }
    user_data = file("./modules/ec2/userdata.sh")
    
    subnet_id = var.public_subnet_id[count.index]
}