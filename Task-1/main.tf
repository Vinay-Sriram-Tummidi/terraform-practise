## Multile Region Resource Creation ##

#default region
provider "aws" {
  region = "ap-southeast-2"
}

#specific region
provider "aws" {
  alias = "region-1"
  region = "us-east-1"
}

#Declaring variable and Reusing them 
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

resource "aws_instance" "instance-1" {
  ami           = "ami-0b8d527345fdace59"
  instance_type = var.instance_type
  tags = {
    Name = "dev-ec2"
  }
}

resource "aws_instance" "instance-2" {
  ami           = "ami-068c0051b15cdb816"
  instance_type = var.instance_type
  provider=aws.region-1
  tags = {
    Name = "test-ec2"
  }
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.instance-1.public_ip
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.instance-2
}