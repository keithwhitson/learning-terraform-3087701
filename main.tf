data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type=var.instance_type
  #instance_type = "t3.nano"
 subnet_id     = "subnet-0c3840e2c57a8b7c6"
  tags = {
    Name = "HelloWorld"
  }
}
