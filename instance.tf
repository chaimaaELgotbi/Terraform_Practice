resource "aws_key_pair" "my_key" {
  key_name   = "my_key"
  public_key = file("my_key.pub")
}


resource "aws_instance" "Ubuntu_server" {
  ami           = var.Ubuntu
  instance_type = "t3.micro"
  # VPC
  subnet_id = aws_subnet.prod-subnet-public.id
  # Security Group
  vpc_security_group_ids = [aws_security_group.allow_public.id]
  key_name               = "ubuntu-key"
  tags = {
    Name = "ubuntu"
  }
  user_data = file("nginx.sh")
  
 
 connection {
  user        = var.user
  host        = self.public_ip
  private_key = file("C:/Users/Chaimaa/Downloads/ubuntu-key.pem")  # path to your AWS private key
}
}



resource "aws_instance" "CentOS_server" {
  ami           = var.CentOS
  instance_type = "t3.micro"
  subnet_id = aws_subnet.prod_subnet_private.id
  availability_zone = var.zone2
  vpc_security_group_ids = [aws_security_group.allow_private.id]
  key_name               = aws_key_pair.my_key.key_name
  tags = {
    Name = "ec2_CentOS"
  }
}
