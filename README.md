# Terraform in practice
In this article, we will document our work in Terrfaorm using AWS as our cloud provider.
We are going to split the tasks each one in section 
To do the tasks first we need to download and install Terraform on Windows.
You can also install Terraform using Windows Powershell using the choco command:
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

