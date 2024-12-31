variable "aws_region" {
  description = "The AWS region to create EC2 instance"
  default     = "eu-north-1" # Change as needed
}

variable "zone1" {
  default = "eu-north-1a"

}

variable "zone2" {
  default = "eu-north-1b"
}

variable "Ubuntu" {
  description = "The AMI ID to use for the ubuntu instance"
  default     = "ami-075449515af5df0d1" 
}

variable "CentOS" {
  description = "The AMI ID to use for the CentOS instance"
  default     = "ami-02df5cb5ad97983ba" 
}

variable "user" {
  default = "ec2-user"
}