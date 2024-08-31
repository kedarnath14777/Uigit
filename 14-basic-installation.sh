#!/bin/bash 

USER=$(id -u)

if [ $USER -eq 0 ]
then 
    echo "you are super user"
else
    echo " need super user access to de this"
    exit 1 # manually exiting 
fi 

dnf install maven -y 

if [ $? -eq 0 ]
then 
    echo "installed successfully"
else
    echo " not installed"
    exit 1 
fi 
