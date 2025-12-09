#!bin/bash

USER=$(id -u)

if [ $USER -ne 0 ] ; then 
  
  echo "Please select the root user otherwise installation will not work"

  exit 1 #failure code 1
fi  



 dnf install mysql  -y

if  [ $? -ne 0 ] ; then 

echo "installion failed check logs"

else 

echo "instalation successful"

fi

dnf install nginx   -y

if  [ $? -ne 0 ] ; then 

echo "installion failed check logs"

else 

echo "instalation successful"

fi


dnf install mongodb-mongosh    -y

if  [ $? -ne 0 ] ; then 

echo "installion failed check logs"

else 

echo "instalation successful"

fi
