#!/bin/bash
dnf install nginx -y 
systemctl enable nginx
systemctl start nginx
rm -rf /usr/share/nginx/html/*
curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip
cd /usr/share/nginx/html

unzip /tmp/frontend.zip
#cp /home/ec2-user/4.0.expense-tf-ec2-instances/expense.conf /etc/nginx/default.d/expense.conf


echo " proxy_http_version 1.1;

location /api/ { proxy_pass http://backend.lithesh.shop:8080/; }

location /health {
  stub_status on;
  access_log off;
} " > /etc/nginx/default.d/expense.conf

systemctl restart nginx

echo "*****************************"
systemctl status nginx
echo "*****************************"