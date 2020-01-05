provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

resource "aws_instance" "microk8s-node" {
  count = 4
  ami           = "ami-0a313d6098716f372"
  instance_type = "t3.small"
  subnet_id     = "subnet-37fd037f"
  associate_public_ip_address = true
  key_name = "cloud-dev-instance"
  tags = {
    Stack = "microk8s"
  }
}
