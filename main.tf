provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [aws_security_group.app_sg.name]

  user_data = templatefile("${path.module}/user_data.tpl", {
    repo_url = var.repo_url
    java_ver = var.java_ver
  })

  tags = {
    Name = "devops-app-server"
  }
}

resource "aws_security_group" "app_sg" {
  name        = "app-sg"
  description = "Allow SSH and App port"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
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
