provider "aws" {
  region = "us-east-2"
  access_key = "AKIAQKYIGT6OZUDFM5KD"
  secret_key = "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"
}
resource "aws_instance" "web" {
  ami           = "ami-00399ec92321828f5"
  instance_type = "t2.micro"
  count =  "2"


  tags = {
    Name = "HelloWorld"
  }
}



resource "aws_lb" "test"{
  name               = "test"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["0ca4f457496f45fd5"]

  subnets            = ["3642424c"]

  enable_deletion_protection = true

  access_logs {
    bucket  = "delete23"
    prefix  = "test-lb"
    enabled = true
  }

  tags = {
    Environment = "production"
  }

}
resource "aws_lb_target_group" "test" {
  name     = "tf"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "2e72d145"
}

resource "aws_vpc" "main" {
  cidr_block = "172.31.0.0/16"
}