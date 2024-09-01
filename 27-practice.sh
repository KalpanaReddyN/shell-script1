#!/bin/bash

DISK_USAGE=$(df -hT) | grep xfs
DISK_THRESHOLD=5
MESSAGE=""

while IFS= read -r line
do
    USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo $line | grep xfs | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        echo $MESSAGE+="$FOLDER is more than disk $DISK_THRESHOLD, current usage: $USAGE"
    fi
done <<< DISK_USAGE

echo "message: $MESSAGE"

