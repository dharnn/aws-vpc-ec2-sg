variable "ami_id" {
    type = string
    default = "ami-0440d3b780d96b29d"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "vpc_id" {
    type= string
}

variable "public_subnet_id" {
    type = list(string)
}

variable "security_group_id" {
    type = string
}
