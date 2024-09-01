#!/bin/bash

RAM_USAGE=$(free -m | grep -i "Mem:")
RAM_THRESHOLD=80
MESSAGE=""

TOTAL_RAM=$(echo $RAM_USAGE | awk -F " " '{print $2F}')
USED_RAM=$(echo $RAM_USAGE | awk -F " " '{print $3F}')

RAM_PERCENTAGE=$(( 100 * $USED_RAM / $TOTAL_RAM ))

if [ $RAM_PERCENTAGE -ge $RAM_THRESHOLD ]
then
    MESSAGE+="RAM usage is above $RAM_THRESHOLD %. current usage: $RAM_PERCENTAGE % ($USED_RAM MB of $TOTAL_RAM MB) "
    
echo -e "message: $MESSAGE"

#echo "$MESSAGE" | mail -s "RAM Usage Alert" krneelapu@gmail.com  
# echo "body" | -s "subject" to-mail address.