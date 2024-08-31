#!/bin/bash 

echo "to know all  params passed" $@

echo " count of params passed" $#

echo "to check the current user" $USER

echo " check the current working dir" $PWD 

echo " home dir of the current user is " $home

echo " Pid of the urrent shell script is ;" $$

echo " name of the current shell script is :" $0

sleep 60 & 

echo " pid of last command is : " $! 

echo " exit status of a previous command is: " $?
