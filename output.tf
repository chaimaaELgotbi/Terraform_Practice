output "public_ip" {
  value = aws_instance.Ubuntu_server.public_ip
}

output "private_ip" {
  value = aws_instance.CentOS_server.public_ip
}

output "server_ubuntu" {
  value = aws_instance.Ubuntu_server.tags
}

output "server_centos" {
  value = aws_instance.CentOS_server.tags
}