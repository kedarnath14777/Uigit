#!/bin/bash 

# basic loop 1 

# for i in {1..20}
# do 
#     echo $i 
# done 

echo "enter the pakages " $@

for i in {i..$@}
do 
    echo $i 
done 
