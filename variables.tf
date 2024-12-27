variable "aws_region" {
  description = "The AWS region to create EC2 instance"
  default     = "us-west-1" # Change as needed
}

variable "Ubuntu" {
  description = "The AMI ID to use for the ubuntu instance"
  default     = "ami-0e2c8caa4b6378d8c" 
}

variable "CentOS" {
  description = "The AMI ID to use for the CentOS instance"
  default     = "ami-0f312279305bbd63e" 
}