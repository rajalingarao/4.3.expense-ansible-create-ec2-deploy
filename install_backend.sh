#!/bin/bash
dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y
useradd expense
mkdir /app

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip
cd /app
unzip /tmp/backend.zip
npm install

#cp /root/4.0.expense-tf-ec2-instances/backend.service /etc/systemd/system/backend.service

echo "[Unit]
Description = Backend Service

[Service]
User=expense
Environment=DB_HOST=mysql.lithesh.shop
ExecStart=/bin/node /app/index.js
SyslogIdentifier=backend

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/backend.service

systemctl daemon-reload
systemctl start backend
systemctl enable backend

dnf install mysql -y
mysql -h mysql.lithesh.shop -u root -pExpenseApp@1 < /app/schema/backend.sql
systemctl restart backend

echo "*****************************"
systemctl status backend
echo "*****************************"