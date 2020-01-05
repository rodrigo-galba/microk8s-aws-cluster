provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web-server" {
  ami = "ami-04b9e92b5572fa0d1"
  availability_zone = "us-east-1a"
  instance_type = "t3.micro"
  tags = {
    "stack" = "terraform"
  }
}

resource "aws_ebs_volume" "ws-volume" {
  availability_zone = "us-east-1a"
  type = "gp2"
  size = 10
  tags = {
    "stack" = "terraform"
  }
}

resource "aws_volume_attachment" "ws-vol-att" {
  device_name = "/dev/sdh"
  instance_id = "${aws_instance.web-server.id}"
  volume_id = "${aws_ebs_volume.ws-volume.id}"
}
