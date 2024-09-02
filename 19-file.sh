#!/bin/bash 

USERID=$(id -u)

TIME_STAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE=/tmp/$SCRIPT_NAME-$TIME_STAMP.log 


dnf install nginx -y &>> LOG_FILE

dnf install mysql -y &>> LOG_FILE