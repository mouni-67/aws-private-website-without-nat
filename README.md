# aws-private-website-without-nat
# Hosting a Website on a Private EC2 Instance Without Using a NAT Gateway

## Project Overview

This project demonstrates how to host a website on a private EC2 instance without using a NAT Gateway.

The web server and website files are first configured on a public Linux EC2 instance. A custom AMI is then created and used to launch a private EC2 instance containing all required software and website files.

A Windows EC2 instance is used as a Bastion Host to access and verify the private EC2 instance.

