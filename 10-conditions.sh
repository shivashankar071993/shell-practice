#!/bin/bash

NUMBER=$1

if [ $NUMBER lt 10 ];
    echo "The given number $NUMBER is smaller than 10"
else 
    echo "The given number $NUMBER is greater than 10"
fi