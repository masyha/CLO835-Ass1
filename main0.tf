provider "aws" {
  region = "us-east-1"  # Replace with your desired region
}

resource "aws_instance" "ass1-instance" {
  ami           = "ami-0c94855ba95c71c99"  # Replace with your desired AMI ID
  instance_type = "t2.micro"                # Replace with your desired instance type
 # key_name      = "ass1"      # Replace with the name of your EC2 key pair
  subnet_id     = "subnet-01d3df7930c991889"   # Use the default public subnet ID of the default VPC
  vpc_security_group_ids = ["sg-03930b1c07b497c1f"]

  tags = {
    Name = "ass1"
  }
}

resource "aws_default_subnet" "default" {
#  vpc_id = "vpc-0aa502995785d5915"  # Use the default VPC ID
  availability_zone = "us-east-1a"

  tags = {
    Name = "default-public-subnet"
  }
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "default-vpc"
  }
}

resource "aws_ecr_repository" "webapp_repository" {
    name = "webapp"
  }


resource "aws_ecr_repository" "mysql_repository" {
    name = "mysql"
 }

