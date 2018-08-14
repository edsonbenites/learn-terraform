#############
# Variables #
#############
variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "aws_region" {
  default = "us-east-2"
}

variable "aws_availability_zone" {
  default = "a"
}

############
# Provider #
############
provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "web" {
  ami               = "ami-id"
  availability_zone = "us-east-2a"
  instance_type     = "t2.micro"

  tags {
    Name = "HelloWorld"
  }
}
