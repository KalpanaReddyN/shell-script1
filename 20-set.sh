#!/bin/bash

set -e  # setting the automatic exit, if we get error, set -ex for debug

failure(){
    echo "Failed at $1: $2"
}

trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run the script with root access"
    exit 1
else
    echo "You are super user"
fi

dnf install mysqlll -y  # change this later
dnf install git -y

echo "is script proceeding" 
