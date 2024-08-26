#!/bin/bash

RAM_USAGE=$(free -m)
DISK_THRESHOLD=10
MESSAGE=""

while IFS= read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $3F}')
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        MESSAGE+="$FOLDER is more than $DISK_THRESHOLD, current usage: $USAGE \n"
    fi
done <<< $DISK_USAGE

echo -e "message: $MESSAGE"

echo "$MESSAGE" | mail -s "Disk Usage Alert" krneelapu@gmail.com  
# echo "body" | -s "subject" to-mail address.