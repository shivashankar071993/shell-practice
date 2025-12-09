#!bin/bash

USER=$(id -u)

if [ $USER -ne 0 ] ; then 
    echo "Please select the root user otherwise installation will not work"
else 

dnf install mysqld

elif [ $? -ne 0 ] ; then 

echo "installation successfull"

else 

echo "instalation failure"

fi
