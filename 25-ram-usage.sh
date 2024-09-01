#!/bin/bash

RAM_USAGE=$(free -m | grep -i "Mem:")
RAM_THRESHOLD=30
MESSAGE=""

TOTAL_RAM=$(echo $RAM_USAGE | awk '{print $2}')
USED_RAM=$(echo $RAM_USAGE | awk '{print $3}')

RAM_PERCENTAGE=$(( 100 * USED_RAM / TOTAL_RAM ))

if [ $RAM_PERCENTAGE -ge $RAM_THRESHOLD ]
then
    MESSAGE+="RAM usage is above $RAM_THRESHOLD%. current usage: $RAM_PERCENTAGE% ($USED_RAM MB used out of $TOTAL_RAM MB) "
else
    MESSAGE+="current usage: $RAM_PERCENTAGE% ($USED_RAM MB of $TOTAL_RAM MB)"
fi

echo "message: $MESSAGE"