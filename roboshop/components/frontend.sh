#!/bin/bash

set -e

# yum install nginx -y
# systemctl enable nginx
# systemctl start nginx
#Let's download the HTML content that serves the RoboSHop Project UI and deploy under the Nginx path.

# curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
#Deploy in Nginx Default Location.

# cd /usr/share/nginx/html
# rm -rf *
# unzip /tmp/frontend.zip
# mv frontend-main/* .
# mv static/* .
# rm -rf frontend-master static README.md
# mv localhost.conf /etc/nginx/default.d/roboshop.conf
#Finally restart the service once to effect the changes.

# systemctl restart nginx



#echo Frontend Setup
#yum install nginx -y
#if [ $? -ne 0 ]; then
  #echo "Nginx Install Failed"
  #exit 1
#fi
#curl -f -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
#if [ $? -ne 0 ]; then
  #echo "Download Frontend Failed"
  #exit 1

echo Frontend Setup
## Check whether the script is running as root user or not
LOG_FILE=/tmp/roboshop.log
rm -f ${LOG_FILE}

STATUS_CHECK() {
  if [ $1 -ne 0 ]; then               #$? means status check and $1 means first argument
    echo -e "\e[1;31m${2} - FAILED\e[0m"
    exit 1
  else
    echo -e "\e[1;32m${2} - SUCCESS\e[0m"
  fi
}

yum install nginx -y &>>${LOG_FILE}
STATUS_CHECK $? "Nginx Installation"

curl -f -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>${LOG_FILE}
STATUS_CHECK $? "Download frontend"

rm -rf /usr/share/nginx/html/*
STATUS_CHECK $? "Remove old HTML Pages"

cd /tmp && unzip /tmp/frontend.zip &>>${LOG_FILE}
STATUS_CHECK $? "Extracting Frontend Content"

cd /tmp/frontend-main/static/ && cp -r * /usr/share/nginx/html/
STATUS_CHECK $? "Copying Frontend Content"

cp /tmp/frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf
STATUS_CHECK $? "Update Nginx Config File"

systemctl enable nginx &>>${LOG_FILE} && systemctl start nginx &>>${LOG_FILE}
STATUS_CHECK $? "Restart Nginx"

#To check that the above script is perfectly working fine, use cat /etc/nginx/default.d/roboshop.conf in PUTTY


