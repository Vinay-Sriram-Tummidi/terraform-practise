provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "instance" {
  ami           = "ami-0b8d527345fdace59" 
  instance_type = var.instance_type
  tags = {
    Name        = "instance-${var.environment}"
    Environment = var.environment
  }
}