#!/bin/bash

SOURCE_DIRECTORY=/tmp/app-logs

if [ -d $SOURCE_DIRECTORY ]
then
    echo "Source directory exists"
else
    echo "Source directory not exists"
fi

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)

echo "deleting files is: $FILES"

while IFS= read -r line
do
    echo "deleting file: $line"
    rm -rf $line
done <<< $FILES