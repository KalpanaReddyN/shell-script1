#!/bin/bash

SOURCE_DIRECTORY=$1
DESTINATION_DIRECTORY=$2
DAYS=$(3:-14) # if $3 is empty, default is 14

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USAGE(){
    echo -e "$R USAGE:: $N sh 29-backup.sh <source> <destination> <days(optional)>"
}

#check the source ad destination are provided
if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIRECTORY ]  # if -d $SOURCE_DIRECTORY is true and the ! make it false
then
    echo "$SOURCE_DIRECTORY doesn not exist..please check"
fi

if [ ! -d $DESTINATION_DIRECTORY ]
then
    echo "$DESTINATION_DIRECTORY doesn not exist..please check"
fi

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)

echo "Files: $FILES"

if [ ! -z $FILES] # -z prints true if FILES is empty, then ! makes the expression false
then 
    echo "Files are found"
else
    echo "No files older than $DAYS"
fi


