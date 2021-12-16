#!/bin/bash

# Printing in shell can be done by using echo command

#Syntax : echo INPUT MESSAGE

echo Hello
echo Hello World

## Example from project
echo Installing Nginx
echo starting Nginx Service

## We can print text in colors
## Syntax : echo -e "\e[COLmMESSAGE\e[0m"

## -e - TO enale enable \e
## \e - To enable colours
## COL - Color code
## m - End of syntax
## 0 - TO disable color
## All the above should be quoted, either single quote or double quotes but preferably double quotes

## Color Codes
#Red       31
#Green     32
#Yellow    33
#Blue      34
#Magneta   35
#Cyan      36



echo -e "\e[31mHello In Red Color\e[0m"
echo -e "\e[32mHello In Green Color\e[0m"
echo -e "\e[33mHello In Yellow Color\e[0m"
echo -e "\e[34mHello In Blue Color\e[0m"
echo -e "\e[35mHello In Magneta Color\e[0m"
echo -e "\e[36mHello In Cyan Color\e[0m"

echo -e "\e[31mNormal Red\e[1;31mBold Red\e[0m"
echo -e "\e[1;31mBold Red\e[0m"

