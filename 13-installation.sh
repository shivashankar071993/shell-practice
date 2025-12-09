#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ] ; then
echo " Please run with root user else will not work"
exit 1
fi

VALIDATE(){

    if [ $1 -ne 0 ] ;  then 
         echo "installation $2 failure"
        exit 1
    else
         echo "instatllation $2 success"

    fi
}

dnf install mysql -y

VALIDATE $? "MYSQL"

dnf install nginx -y

VALIDATE $? "NGINX"

dnf install mongodb mongosh -y

VALIDATE $? "MONGODB"