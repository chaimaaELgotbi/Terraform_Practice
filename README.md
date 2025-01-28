# Terraform in practice
In this article, we will document our work in Terrfaorm using AWS as our cloud provider.
We are going to split the tasks each one in section 

## First step: set up the environment
To do the tasks first we need to download and install Terraform on Windows.
Install Terraform using Windows Powershell use the choco command:
```

# Open the PowerShell as admin and run the below command (make sure to install choco package on windows.)

choco install terraform
```

![image](https://github.com/user-attachments/assets/cb8afdae-3f10-456a-a59b-fcf4482828d7)
![image](https://github.com/user-attachments/assets/874670d9-3fe9-4116-8649-0c7713720e8d)

Next, we need to install AWS CLI:

```
choco install awscli -y

```

![image](https://github.com/user-attachments/assets/36ffac49-0744-4c80-9e0f-329f41a53dc4)

To check the version tape:
```
aws --version

```

![image](https://github.com/user-attachments/assets/31f9daaa-f17b-4170-8ad0-883ed3cd2d27)


Now Go to your AWS interface and generate a key access:
![image](https://github.com/user-attachments/assets/72e44a49-6fd8-4e24-8c19-fb342b68b08b)

Once the credentials have been created for the user we can access it using CLI.
Open Gitbash or any other terminal and follow the below steps:

- Tape this cmd:
```
aws configure
```
![image](https://github.com/user-attachments/assets/dc54c9b3-4138-4592-8015-bad0c7981edd)

Copy and paste your access key and secret. Enter the region code if you are using a different region


## second step: Create the Infrastructure

1. Create your working folder:

I have chosen Terraform Practice

2. Create "provider.tf":

This file where we are going to define the cloud provider in our case we are using "AWS".
If you want to use another cloud provider such as GCP or Azure, you need to change this.

```
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}
``` 
We are ready to init:

![image](https://github.com/user-attachments/assets/bf1c247f-c656-4573-b05b-151349453c77)


3. Create "vpc.tf":
check the code in the VPC file here some parametrs expliniation:

- cidr_block: 10.0.0.0/16 allows you to use the IP address that start with "10.0.X.X". There are 65,536 IP addresses are ready to use.
- instance_tenancy: if it is true, your ec2 will be the only instance in an AWS physical hardware. Sounds good but expensive.

- map_public_ip_on_launch: This is so important. The only difference between private and public subnet is this line. If it is true, it will be a public subnet, otherwise private.