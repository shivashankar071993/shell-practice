#!bin/bash

#CODE started 


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0| cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "SCRIPT started executing $(date)" | tee -a $LOG_FILE 

USERID=$(id -u)

date &>>$LOG_FILE

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
dnf list installed mysql &>>$LOG_FILE
# installed if it is not found

if [ $? -ne 0 ]; then 
dnf install mysql -y &>>$LOG_FILE
VALIDATE $? "MYSQL"
else 
    echo -e "MYSQL Is already installed...$G Skipping $N" | tee -a $LOG_FILE

fi
###installing nginx
dnf list installed nginx &>>$LOG_FILE

if [ $? -ne 0 ]; then 
dnf install nginx -y &>>$LOG_FILE
VALIDATE $? "nginx"
else 
    echo -e "NGINX Is already installed...$G Skipping $N" | tee -a $LOG_FILE
fi

###installing python
dnf list installed python3 &>>$LOG_FILE

if [ $? -ne 0 ]; then 
dnf install python3 -y  &>>$LOG_FILE
VALIDATE $? "python"
else 
    echo -e "Python Is already installed...$G Skipping $N" | tee -a $LOG_FILE
fi
#Coded ended
