#!/bin/bash

username=wuraola
#read -p 'Enter Username: ' username
#username=$1

echo "Adding User - ${username}"
useradd ${username}
echo password | passwd --stdin ${username}
echo "Successfully added user - ${username}"