#!/bin/bash
sudo yum upate -y
sudo yum install -y docker
sudo systemctl enable docker
sudo systemctl start docker
sudo yum install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
sudo usermod -a -G docker ec2-user

docker run -d -p 8080:80 nginx
docker run -d -p 8081:80 nginx

