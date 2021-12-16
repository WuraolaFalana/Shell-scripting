#!/bin/bash

## If we assign a name to a set of data, is called Variable

# Syntax: VARNAME=DATA
a=100       #Number
b=apple     #String
c=true      #Boolean

#Shell does not have any data type by default

#Access the variables, variable will be accessed in two ways
#1. $VARNAME , $ preceding to the variable name, Ex: $a to access a variable
#2. ${VARIABLE}, $ preceding along with variable bonded in flower braces, Ex: ${a}

## Best practice is using flower braces.
echo a = $a
echo a in currency = $$a
echo a in currency = $${a}
echo a in currency = $aUSD
echo a in currency = ${a}USD