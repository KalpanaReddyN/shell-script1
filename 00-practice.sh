#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=(echo $0 | cut -d '.' -f1) 
LOG_FILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

CHECKROOT(){
    if [ USERID -ne 0 ]
    then
        echo " Please run the script using root access"
    else
        echo " You are super user"
    fi
}

CHECKROOT

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo " $2....failure"
    else
        echo " $2....Success"
    fi
}

dnf install mysql -y &>>LOG_FILE
VALIDATE $? "Installing mysql server"



