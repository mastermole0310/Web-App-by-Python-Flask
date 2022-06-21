terraform {
  backend "s3" {
    bucket         = "my-terraform-tfstates"
    key            = "terraform.tfstate"
    region         = "us-east-2"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.74.3"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  #profile = "default"
  region  = "us-east-2"
}

locals {
  private_key=file("C:/Users/алексей/Desktop/alexs.pem")
}


resource "aws_instance" "web_app" {
  ami                    = "ami-0eea504f45ef7a8f7"
  availability_zone = "us-east-2c"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.mywebserver.id]

provisioner "file" {
  source = "app.py"
  destination = "/home/ubuntu/app.py"
}

provisioner "file" {
  source = "index.html"
  destination = "/home/ubuntu/index.html"
}
provisioner "file" {
  source = "Dockerfile"
  destination = "/home/ubuntu/Dockerfile"
}
provisioner "file" {
  source = "my_json.json"
  destination = "/home/ubuntu/my_json.json"
}

provisioner "file" {
  source = "requirements.txt"
  destination = "/home/ubuntu/requirements.txt"
}

    connection {
      type     = "ssh"
      user     = "ubuntu"
      host = self.public_ip
      private_key = local.private_key
    } 

    
  user_data = file("userdata.sh")


  key_name = "alexs"
  tags = {
    Name = "web_app"
  }
}

resource "aws_security_group" "mywebserver" {
  name        = "webserver security group"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
