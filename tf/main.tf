provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_instance" "webserver" {
  key_name        = "MyKP"
  ami             = var.ami_map[var.region]
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.WebServerSG.name]

  user_data = file("bootstrap.sh")
}

resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.webserver.id
}

resource "aws_security_group" "WebServerSG" {
  name        = "WebServerSG"
  description = "Allows inbound HTTP traffic and SSH traffic"

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "WebServerSG"
  }
}