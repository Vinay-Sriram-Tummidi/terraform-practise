provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "instance-1" {
  ami           = "ami-0b8d527345fdace59"
  instance_type = "t3.micro"

  tags = {
    Name = "dev-ec2"
  }
}