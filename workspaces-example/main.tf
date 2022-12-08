terraform {
  backend "s3" {
    bucket = "terraform-up-and-running-state-ef12"
    key    = "workspaces-example/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0d5bf08bc8017c83b"
  instance_type = terraform.workspace == "default" ? "t2.medium" : "t2.micro"
}
