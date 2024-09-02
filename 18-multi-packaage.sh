#!/bin/bash

USER=$(id -u)
TIME=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$($0 | cut -d "." -f1 )
logs=/tmp/$SCRIPT_NAME-$TIME.log 

# colour enabling 
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"



echo $logs

if [ $USER -eq 0 ]
then 
    echo -e "$G you are super user $N " 
else
    echo -e "$R  need super user access to de this $N "
    exit 1 # manually exiting 
fi 
MY_PACKAGES=$@
for i in ${MY_PACKAGES[@]}
do 
    dnf list installed $i  &>>logs
    if [ $? -eq 0 ]
    then 
        echo -e  "$Y already installed $i .. SKPPINNG " $N  &>>logs
    else 
        dnf install $i -y  &>>logs
        if [ $? -eq 0 ]
        then
            echo -e  " $G installing $i $N " 
    fi 
done 


