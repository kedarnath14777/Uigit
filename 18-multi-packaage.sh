#!/bin/bash

USER=$(id -u)
TIME=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$($0 | cut -d "." -f1 )
logs=/tmp/$SCRIPT_NAME-$TIME.log 

echo $logs

if [ $USER -eq 0 ]
then 
    echo "you are super user" 
else
    echo " need super user access to de this"
    exit 1 # manually exiting 
fi 
MY_PACKAGES=$@
echo "please enter the packages " $MY_PACKAGES

for i in ${MY_PACKAGES[@]}
do 
    dnf list installed $i  &>>logs
    if [ $? -eq 0 ]
    then 
        echo "already installed $i" &>>logs
    else 
        dnf install $i -y 
    fi 
done 


