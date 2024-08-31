#!/bin/bash

SOURCE_DIRECTORY=/tmp/app-logs

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $SOURCE_DIRECTORY ]   # step1 checking whether directory there/not.
then 
    echo -e "$G source directory exists $N"
else
    echo -e "$R please make sure $SOURCE_DIRECTORY exists $N"
    exit 1
fi

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)  #step2 showing which files to delete ex.log files

echo "Files to delete: $FILES"


while IFS= read -r line               # step3 using while loop step by step deleting the files
do                                    # read -r line means giving line as delimeter and it will read line by line
    echo "Deleting file: $line"
    rm -rf $line
done <<< $FILES
