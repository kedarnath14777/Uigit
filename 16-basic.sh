#!/bin/bash

USERID=$(id -u)

TIME_STAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1 )
LOG_FILE=/tmp/$SCRIPT_NAME-$TIME_STAMP.log

# super user validate 
if [ $USERID -eq 0 ]
then 
    echo " u r super user "
else
    echo " need super user access"
    exit 1 # manually exiting 
fi 

VALIDATE_FUNCTION(){
    if [ $? -eq 0 ]
    then
        echo "$2 .. Successfully.."
    else
        echo "$@.. Failed" 
    fi 

}

dnf install mysql -y 
VALIDATE_FUNCTION $? "instaling mysql"

dnf install git -y 
VALIDATE_FUNCTION $? "instaling git"

dnf install maven -y 
VALIDATE_FUNCTION $? "instaling maven "
