provider "aws" {
  region  = "cn-north-1"  
}

resource "aws_instance" "example" {
  ami           = "ami-0c6b1d09930fac512"
  instance_type = "t2.micro"
  subnet_id = "subnet-0a5efb56da3a70ecf"
}
