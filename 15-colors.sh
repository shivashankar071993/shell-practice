#!bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


USERID=$(id -u)

if [ $USERID -ne 0 ] ; then
echo " Please run with root user else will not work"
exit 1
fi

VALIDATE(){

    if [ $1 -ne 0 ] ;  then 
         echo -e "installation $2... $R failure $N"
        exit 1
    else
         echo "instatllation $2... $G success $N"

    fi
}


##installing mysql
dnf list installed mysql
# installed if it is not found

if [ $? -ne 0 ]; then 
dnf install mysql -y 
VALIDATE $? "MYSQL"
else 
    echo -e "MYSQL Is already installed...$G Skipping $N"


###installing nginx
dnf list installed nginx

if [ $? -ne 0 ]; then 
dnf install nginx -y 
VALIDATE $? "nginx"
else 
    echo -e "NGINX Is already installed...$G Skipping $N"


###installing python
dnf list installed python3

if [ $? -ne 0 ]; then 
dnf install python3 -y 
VALIDATE $? "python"
else 
    echo -e "Python Is already installed...$G Skipping $N"

#Coded ended
