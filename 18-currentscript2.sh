#!/bin/bash

COURSE="Devops from current script"

echo "Before calling the other script, course: $COURSE"
echo "Process ID of current shell script: $$"

source ./19-otherscript2.sh

echo "After calling the other script, course: $COURSE"