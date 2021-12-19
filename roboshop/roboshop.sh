#!/bin/bash

#Check whether the script is running as root user or not
UserID=$(id -u)
if [ ${UserID} -ne 0 ]; then
  echo -e "\e[1;31mYou should be a root user to perform this script\e[0m"
  exit
  fi

export COMPONENT=$1
if [ -z "$COMPONENT" ]; then
  echo -e "\e[1;31mComponent Input Missing\e[0m"
    exit
fi

if [ ! -e components/${COMPONENT}.sh ]; then
    echo -e "\e[1;31mGiven component script does not exist\e[0m"
      exit
fi

bash components/${COMPONENT}.sh