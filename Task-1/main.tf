# Multile Region Resource Creation

#default region
provider "aws" {
  region = "ap-southeast-2"
}

#specific region
provider "aws" {
  alias = "region-1"
  region = "us-east-1"
}

resource "aws_instance" "instance-1" {
  ami           = "ami-0b8d527345fdace59"
  instance_type = "t3.micro"
  tags = {
    Name = "dev-ec2"
  }
}

resource "aws_instance" "instance-2" {
  ami           = "ami-068c0051b15cdb816"
  instance_type = "t3.micro"
  provider=aws.region-1
  tags = {
    Name = "test-ec2"
  }
}