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
SOURCE_DIR=$1
DEST_DIR=$2
Days=${3:-14}


mkdir -p $LOGS_FOLDER
echo "SCRIPT started executing $(date)" | tee -a $LOG_FILE 

if [ $USERID -ne 0 ] ; then
echo " Please run with root user else will not work"
exit 1
fi

USAGE() {

    echo "USAGE:sudo sh  24-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS>[Optional ,default 14 days ]"
    exit 1
}

if [ $# -lt 2 ]; then 
    USAGE

fi

if [ ! -d $SOURCE_DIR ]; then 
    echo -e "$R $SOURCE_DIR doesnot exists please check $N"
    exit 1
fi

if [ ! -d $DEST_DIR ]; then 
    echo -e "$R $DEST_DIR doesnot exists please check $N"
    exit 1
fi


FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$Days)

if [ ! -z "${FILES}" ]; then 
    echo "files found" $FILES

   TIMESTAMP=$(date +%F-%H-%M)
   ZIP_FILE_NAME="$DEST_DIR/app_logs_$TIMESTAMP.zip"
   echo "ZIP file name :$ZIP_FILE_NAME"
   find $SOURCE_DIR -name "*.log" -type f -mtime +$Days | zip -@ -j "$ZIP_FILE_NAME"

else 
    echo -e "No files to archive $Y Skipping $N"
fi
