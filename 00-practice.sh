#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"


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
        echo -e "$1....$R Failure $N"
        exit 1
    else
        echo -e "$2....$G Success $N"
    fi
}

dnf install mysql -y
VALIDATE $? "Installing mysql-server"

dnf install git -y
VALIDATE $? "Installing git"


