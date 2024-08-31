#!/bin/bash 

USER=$(id -u)
TIME=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$($0 | cut -d "." -f1 )
logs=$TIME-$SCRIPT_NAME.log 


if [ $USER -eq 0 ]
then 
    echo "you are super user"
else
    echo " need super user access to de this"
    exit 1 # manually exiting 
fi 

validate_installation(){
    if [ $1 -eq 0 ]
    then    
        echo "installed successfuly $2 "
    else
        echo "not installed $2"
        exit 
    fi 

}


dnf install mysql -y 

validate_installation $? mysql


dnf install git -y 

validate_installation $? mysql

