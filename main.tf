provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "example" {
    #ami = "ami-a0cfeed8"
    ami = "ami-0ff8a91507f77f867"
    instance_type = "t2.micro"
    user_data     = file("init-script.sh")

    

    vpc_security_group_ids = [aws_security_group.security.id]

    tags = {
        Name = "example name"
    }
}

resource "aws_security_group" "security" {
    name = "example security group"

    
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # egress {
    #     from_port = 0
    #     to_port = 8080
    #     protocol = "tcp"
    #     cidr_blocks = ["0.0.0.0/0"]
    # }
}