# aws-private-website-without-nat
# Hosting a Website on a Private EC2 Instance Without Using a NAT Gateway

## Project Overview

This project demonstrates how to host a website on a private EC2 instance without using a NAT Gateway.

The web server and website files are first configured on a public Linux EC2 instance. A custom AMI is then created and used to launch a private EC2 instance containing all required software and website files.

A Windows EC2 instance is used as a Bastion Host to access and verify the private EC2 instance.

---

## AWS Services Used

- Amazon VPC
- EC2
- Amazon Machine Image (AMI)
- Internet Gateway
- Route Tables
- Security Groups

---

## Architecture

```text
Internet
    |
Internet Gateway
    |
Public Subnet
├── Linux EC2
└── Windows EC2
       |
       v
Private EC2 (Created from AMI)
```

---

## Step-by-Step Implementation

### Step 1: Create VPC

CIDR Block:

```text
10.0.0.0/16
```

---

### Step 2: Create Subnets

Public Subnet:

```text
10.0.1.0/24
```

Private Subnet:

```text
10.0.2.0/24
```

---

### Step 3: Create Internet Gateway

- Create Internet Gateway
- Attach it to the VPC

---

### Step 4: Create Route Tables

Public Route Table:

```text
0.0.0.0/0 → Internet Gateway
```

Associate with Public Subnet.

Private Route Table:

No internet route.

Associate with Private Subnet.

---

### Step 5: Launch Public Linux EC2

- Launch Amazon Linux EC2
- Place it in Public Subnet
- Assign Public IP

Install Apache:

```bash
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
```

Create Website:

```bash
sudo vi /var/www/html/index.html
```

---

### Step 6: Verify Website

Open browser:

```text
http://Public-IP
```

Website should be accessible.

---

### Step 7: Create Custom AMI

EC2 → Actions → Image and Templates → Create Image

This AMI contains:

- Operating System
- Apache Web Server
- Website Files
- Configuration

---

### Step 8: Launch Private EC2

- Launch new EC2 using the Custom AMI
- Place instance in Private Subnet
- Do not assign Public IP

---

### Step 9: Launch Windows EC2

- Launch Windows EC2 in Public Subnet
- Assign Public IP

Purpose:

- Bastion Host
- Access private EC2
- Verify services

---

### Step 10: Connect to Private EC2

Connect to Windows EC2 using RDP.

From Windows EC2, connect to Private EC2 using its private IP.

Verify:

```bash
systemctl status httpd
```

---

## Security Benefits

- Private EC2 has no Public IP.
- Private EC2 is not directly accessible from the internet.
- No NAT Gateway required.
- Reduced attack surface.
- Better network security.

---

## Learning Outcomes

This project helped me understand:

- Amazon VPC
- Public and Private Subnets
- Route Tables
- Internet Gateway
- EC2
- Custom AMI Creation
- Bastion Host Architecture
- AWS Networking Fundamentals

---

## Interview Explanation

I created a VPC with public and private subnets. First, I launched a public Linux EC2 instance and hosted a website using Apache. Then I created a custom AMI from the configured instance. Using that AMI, I launched a private EC2 instance that already contained the web server and website files. To manage and verify the private instance, I launched a Windows EC2 instance in the public subnet and used it as a Bastion Host. This allowed me to host and manage a website on a private EC2 instance without using a NAT Gateway.

---

## Author

Mounika Pasupuleti
AWS Cloud & DevOps Enthusiast
