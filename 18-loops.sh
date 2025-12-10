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


for pacakge in $@
do 
    #check whether package is installed or not
    dnf list installed $pacakge &>>LOG_FILE
    if [ $? -ne 0 ]; then 
        dnf install $package -y &>>LOG_FILE
        VALIDATE $? "$package"
    else 
        echo -e "$package already installed...$Y SKipping $N"
    fi
done