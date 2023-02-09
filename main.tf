provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

variable "region" {
  type    = string
  default = "us-west-2"
}
variable "access_key" {
  type    = string
  default = "AKIAS7YWSEO6DCRXWCWT"
}
variable "secret_key" {
  type    = string
  default = "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"
}

data "aws_ami" "image_id" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-arm64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "id1" {
  value = data.aws_ami.image_id.id
}
