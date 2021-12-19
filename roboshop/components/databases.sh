#!/bin/bash

#Check whether the script is running as root user or not
#UserID=$(id -u)
#if [ ${UserID} -ne 0 ]; then
  #echo -e "\e[1;31mYou should be a root user to perform this script\e[0m"
  #exit
  #fi
  source components/common.sh

  #Setup MongoDB repos.
  # curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo
  #Install Mongo & Start Service.
  # yum install -y mongodb-org
  # systemctl enable mongod
  # systemctl start mongod
  #Update Liste IP address from 127.0.0.1 to 0.0.0.0 in config file
  #Config file: /etc/mongod.conf

  #then restart the service

  # systemctl restart mongod
  #Every Database needs the schema to be loaded for the application to work.
  #Download the schema and load it.

  # curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"

  # cd /tmp
  # unzip mongodb.zip
  # cd mongodb-main
  # mongo < catalogue.js
  # mongo < users.js




### MongoDB Set
echo -e "       ------->>>>>>>> \e[1;35mMongDB Setup\e[0m  <<<<<<<<---------"
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>${LOG_FILE}
STATUS_CHECK $? "Download MongDB repo"

yum install -y mongodb-org &>>${LOG_FILE}
STATUS_CHECK $? "Install MongDB"

systemctl enable mongod &>>${LOG_FILE} &&  systemctl start mongod &>>${LOG_FILE}
STATUS_CHECK $? "Start MongDB Service"

sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>>${LOG_FILE}
STATUS_CHECK $? "Update MongoDB Service"

systemctl enable mongod &>>${LOG_FILE} &&  systemctl restart mongod &>>${LOG_FILE}
STATUS_CHECK $? "Start MongDB Service"

DOWNLOAD mongodb

cd /tmp/mongodb-main
mongo < catalogue.js &>>${LOG_FILE} && mongo < users.js &>>${LOG_FILE}
STATUS_CHECK $? "Load Schema"




#Install Redis.
# curl -L https://raw.githubusercontent.com/roboshop-devops-project/redis/main/redis.repo -o /etc/yum.repos.d/redis.repo
# yum install redis -y
#Update the BindIP from 127.0.0.1 to 0.0.0.0 in config file /etc/redis.conf & /etc/redis/redis.conf

#Start Redis Database

# systemctl enable redis
# systemctl start redis


### Redis SetUp
echo -e "       ------->>>>>>>> \e[1;35mRedisDB Setup\e[0m  <<<<<<<<---------"
curl -L https://raw.githubusercontent.com/roboshop-devops-project/redis/main/redis.repo -o /etc/yum.repos.d/redis.repo &>>${LOG_FILE}
STATUS_CHECK $? "Download Redis repo"

yum install redis -y &>>${LOG_FILE}
STATUS_CHECK $? "Install Redis"

sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis.conf &>>${LOG_FILE}   #Here we added -e option but we did not for MongoDB above
STATUS_CHECK $? "Update Redis Config"

systemctl enable redis &>>${LOG_FILE} &&  systemctl start redis &>>${LOG_FILE}
STATUS_CHECK $? "Start Redis Service"
