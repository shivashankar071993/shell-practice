#!/bin/bash

echo "Please enter the number"
read NUMBER 

if [$(($NUMBER % 2)) -eq 0]; then
    echo " the given  $NUMBER is even number "
else 
    echo " the given $NUMBER is ODD NUmber"
fi