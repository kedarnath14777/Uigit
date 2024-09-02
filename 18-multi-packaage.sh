#!/bin/bash

USER=$(id -u)
TIME=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1 )
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


VALIDATE_FUNCTION(){
    if [ $? -eq 0 ]
    then
        echo -e " $G $2 .. Successfully.. $N"
    else
        echo -e  " $R  $@.. Failed $N" 
    fi 

}




for i in $@
do 
    echo "packages installaing: " $i
    dnf list installed $i &>>logs
    if [ $? -eq 0 ]
    then 
        echo -e  "$Y already installed $i .. SKPPINNG $N"   
    else 
        dnf install $i -y &>>logs
        VALIDATE_FUNCTION $? "instaling $i" 
    fi 
done 


