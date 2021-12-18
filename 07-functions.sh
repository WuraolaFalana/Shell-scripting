#!/bin/bash

#Variable - We assign a name to set of data is called a variable
#Function - We assign a name to set of commands is called a function

# Declare a function.
#Method 1
function sample() {
  echo one
  echo two

}

#Method2
sample1() {
  echo one
  echo two
}

## Call the function
sample
sample1

#Function just acts like command. It is one of four types of commands.

# 1. Binaries
# 2. Shell Built-in commands
# 3. Alias
#4. Functions

## Functions have its own special variables
sample2() {
  echo First Argument = $1
  echo Number of Arguments = $#
}

sample2 123 xyz
