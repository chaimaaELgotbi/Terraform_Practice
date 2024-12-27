resource "aws_instance" "Ubuntu_server" {
  ami           = var.Ubuntu
  instance_type = "t2.micro"

  tags = {
    Name = "ec2_Ubuntu"
  }
}



resource "aws_instance" "CentOS_server" {
  ami           = var.CentOS
  instance_type = "t2.micro"

  tags = {
    Name = "ec2_CentOS"
  }
}
