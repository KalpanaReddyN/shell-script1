#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=10  #real projects, it is usually 75
MESSAGE=""

while IFS= read -r line   #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1 )
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        MESSAGE+="$FOLDER is more than $DISK_THRESHOLD, current usage: $USAGE \n"
    fi
done <<< $DISK_USAGE

echo -e "message: $MESSAGE"

echo "$MESSAGE" | mail -s "Disk Usage Alert" krneelapu@gmail.com  
# echo "body" | -s "subject" to-mail address.