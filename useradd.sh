#!/bin/bash

username=wuraola

echo "Adding User - ${username}"
useradd ${username}
echo password | passwd --stdin ${username}
echo "Successfully added user - ${username}"