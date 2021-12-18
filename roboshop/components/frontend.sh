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


## Check whether the script is running as root user or not
echo Frontend Setup
STATUS_CHECK() {
  if [ $1 -ne 0 ]; then               #$? means status check and $1 means first argument
    echo "$2"
    exit 1
  fi
}

yum install nginx -y
STATUS_CHECK $? "Nginx Installation Failed"

curl -f -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
STATUS_CHECK $? "Download frontend Failed"

cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-master static README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf
systemctl enable nginx
systemctl start nginx
