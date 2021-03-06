#!/bin/bash

## Conditions are two types

#1. if command (Mostly used)
#2. case command (Rarely used)

#IF COMMAND
# 1. Simple if

Syntax:
#if [ expression ]; then
#  commands
# fi

#If the expression is true, then commands will be executed

#2. If Else

Syntax:
#if [ expression ]; then
#  commands-1
#else
#  commands-2
#fi

#If expression is true then commands-1 will be executed, if not commands-2 will be executed

#3. Else If (is about having multiple expressions)

#Syntax:

#if [ expression-1 ]; then
  #commands-1
#elseif [expression-2]; then
  #commands-2
#else
  #commands-else
#fi

#If expression-1 is true then commands-1 will be executed, if not expression-2 is true, then commands-2 will be
# executed. If both expressions are false, then commands-else will be executed.

# Expressions

#1. Strings
 #Operators : =, ==, !=, -z
 #Ex: [ abc == abc  ]
# 2. Numbers
  #Operators : -eq, -ne, -gt, -ge, -lt, -le
  #ex: [ 1 -eq 0 ]
#3. Files
 #Operators : -e - to check if file exists or not
        #(there are so many and documentation can be referred to when needed)

read -p 'Enter your age: ' age
#if [ -z "$age" ]; then
  #echo Input Missing
  #exit
#fi

if [ ! -z "${age}" -a "${age}" -lt 18 ]; then
  echo You are a Minor
elif [ ! -z "${age}" -a "${age}" -gt 60 ]; then
  echo You are a Senior Citizen
else
  echo You are a Major
fi

## Note:When you use variables in expressions of if statment, always double quote them, not single quote

## Expressions can be combined
# [ Expression1 Expression2]
#LOGICAL AND -a
# [ Expression1 -a Expression2] -> True if both are true

#LOGICAL OR -o
# [ Expression1 -o Expression2] -> True if any expression is true
