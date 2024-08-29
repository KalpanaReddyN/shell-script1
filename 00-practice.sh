#!/bin/bash

USERID=$(id -u)

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Please run the script with root access"
    else
        echo "You are super user"
    fi
}

CHECK_ROOT

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo "$1....Failure"
        exit 1
    else
        echo "$2....Success"
    fi
}

dnf install mysql -y
VALIDATE $? "Installing mysql-server"

dnf install git -y
VALIDATE $? "Installing git"


