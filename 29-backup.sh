#!/bin/bash

SOURCE_DIRECTORY=$1
DESTINATION_DIRECTORY=$2
DAYS=$(3:-14) # if $3 is empty, default is 14

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USAGE(){
    echo -e "$R USAGE:: $N sh 29-backup.sh <source> <destination> <days(optional)>"
}

#check the source ad destination are provided
if [ $# -lt 2 ]
then
    USAGE
fi

