#!/bin/bash

SOURCE_DIRECTORY=/tmp/app-logs

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $SOURCE_DIRECTORY ]    #-d: Checks if the specified path is an existing directory.
then
    echo "source directory exists"
else
    echo "please make sure source directory exists"
fi

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)

echo "Files to delete: $FILES"

while IFS= read -r line
do
    echo "Deleting file: $line"
    rm -rf $line
done <<< $FILES

