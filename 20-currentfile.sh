#!bin/bash 

course="devops with AWS"

echo "before caling from another file $course"

echo "pid is $$"

#./21-anotherfile.sh

source /21-anotherfile.sh


echo "Afterr caling from another file $course"
echo "pid is $$"