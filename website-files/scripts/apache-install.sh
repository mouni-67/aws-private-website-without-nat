#!/bin/bash

sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd

echo "<h1>Website Hosted on AWS EC2</h1>" > /var/www/html/index.html
