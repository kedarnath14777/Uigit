#!bin/bash 

course="devops from current script  "

echo "before caling from  script $course"

echo "pid is $$"

#./21-anotherfile.sh

# the aboue way have same pid 

source /21-anotherfile.sh


echo "Afterr caling from  script  $course"
