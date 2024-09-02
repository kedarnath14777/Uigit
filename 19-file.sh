#!/bin/bash 

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

if [ $USERID -eq 0 ]
then
    echo " you are super user"
else 
    echo "you r not"
    exit 1 
fi 

VALIDATE_FUNCTION(){
    if [ $? -eq 0 ]
    then
        echo "installation successfull $2"
    else 
        echo " not installed $2"
        exit 1
    fi 
}


dnf install nginx -y &>> LOG_FILE
VALIDATE_FUNCTION $? "installing nginx"

dnf install mysql -y  &>> LOG_FILE
VALIDATE_FUNCTION $? "installing mysql "