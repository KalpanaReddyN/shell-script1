#!/bin/bash

COURSE="Devops from current script"

echo "Before calling the other script, course: $COURSE"
echo "Process ID of current shell script: $$"

./17-otherscript.sh

#source ./17-otherscript.sh

echo "After calling the other script, course: $COURSE"