variable "aws_region" {
  default = "ap-south-1"
}

variable "ami_id" {
  description = "Ubuntu 22.04 LTS AMI"
  default     = "ami-0f58b397bc5c1f2e8"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "Your AWS key pair name"
}

variable "repo_url" {
  default = "https://github.com/Trainings-TechEazy/test-repo-for-devops"
}

variable "java_ver" {
  default = "21"
}
