#!bin/bash 

course="devops form current Script"

echo "before calling  other script $course"

echo "pid of current script $$"

./21-anotherfile.sh

echo "after calling another script $course"

