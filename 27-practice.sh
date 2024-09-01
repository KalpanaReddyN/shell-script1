#!/bin/bash

DISK_USAGE=$(df -hT) | grep xfs
DISK_THRESHOLD=5
MESSAGE=""

while IFS= read -r line
do
    USAGE=$line | awk -F " " '{print $6F}' | cut -d "%" -f1
    FOLDER=$line | awk -F " " '{print $NF}'
done <<< DISK_USAGE

if [ $USAGE -ge $DISK_THRESHOLD ]
then
    echo $MESSAGE+="$FOLDER is more than disk $DISK_THRESHOLD, current usage: $USAGE"
fi

echo "message: $MESSAGE"

