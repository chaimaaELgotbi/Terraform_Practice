#Create a VPC
resource "aws_vpc" "cloud_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true   # Enables internal DNS resolution
  enable_dns_hostnames = true   # Assigns DNS hostnames to instances with public IPs
  #instance_tenancy     = "default" # Default tenancy for instances in this VPC
  #enable_classiclink = "false"
  tags = {
    Name = "cloud_vpc"
  }
}


#Create Public Subnet
resource "aws_subnet" "prod-subnet-public" {
    vpc_id = aws_vpc.cloud_vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true //it makes this a public subnet
    availability_zone = var.zone1

    tags = {
        Name = " prod-subnet-public"
    }
}



# Create Private Subnet
resource "aws_subnet" "prod_subnet_private" {
  vpc_id                  = aws_vpc.cloud_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = false # Makes this a private subnet
  availability_zone       = var.zone2

  tags = {
    Name = "prod-subnet-private"
  }
}



#Create Internet Gateway
resource "aws_internet_gateway" "prod-igw" {
    vpc_id = aws_vpc.cloud_vpc.id
    tags = {
        Name = "prod-igw"
    }
}


#Create Custom Route Table
resource "aws_route_table" "prod-public-crt" {
    vpc_id = aws_vpc.cloud_vpc.id
    
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0" 
        //CRT uses this IGW to reach internet
        gateway_id = aws_internet_gateway.prod-igw.id
    }
    
    tags = {
        Name = "prod-public-crt"
    }
}



#Associate CRT and Subnet
resource "aws_route_table_association" "prod-crta-public-subnet"{
    subnet_id = aws_subnet.prod-subnet-public.id
    route_table_id = aws_route_table.prod-public-crt.id
}


