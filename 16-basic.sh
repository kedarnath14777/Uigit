#!/bin/bash

USERID=$(id -u)

TIME_STAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1 )
LOG_FILE=/tmp/$SCRIPT_NAME-$TIME_STAMP.log
# colour enabling 
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# super user validate 
if [ $USERID -eq 0 ]
then 
    echo -e "$G u r super user $N "
else
    echo -e "$R need super user access $N"
    exit 1 # manually exiting 
fi 

VALIDATE_FUNCTION(){
    if [ $? -eq 0 ]
    then
        echo -e " $G $2 .. Successfully.. $N"
    else
        echo -e  " $R  $@.. Failed $N" 
    fi 

}

dnf install mysql -y &>> LOG_FILE
VALIDATE_FUNCTION $? "instaling mysql"

dnf install git -y &>> LOG_FILE
VALIDATE_FUNCTION $? "instaling git"

dnf install maven -y &>> LOG_FILE
VALIDATE_FUNCTION $? "instaling maven "
