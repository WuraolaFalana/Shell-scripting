#!/bin/bash

#Check whether the script is running as root user or not
UserID=$(id -u)
if [ ${UserID} -ne 0 ]; then
  echo -e "\e[1;31mYou should be a root user to perform this script\e[0m"
  exit
  fi