#!bin/bash

USER=$(id -u)

if [ $USER -ne 0 ] ; then 
    echo "Please select the root user otherwise installation will not work"
fi  

exit 1 #failure code i

sudo dnf install mysqld -y

if  [ $? -ne 0 ] ; then 

echo "installion failed check logs"

else 

echo "instalation successful"

fi
