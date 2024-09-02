#!/bin/bash

userid=$(id -u)

time=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1 )

echo $SCRIPT_NAME