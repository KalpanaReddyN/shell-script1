#!/bin/bash

SOURCE_DIRECTORY=$1
DESTINATION_DIRECTORY=$2
DAYS=${3:-14}        # if $3 is empty, default is 14
TIMESTAMP=$(date +%F-%H-%M-%S)

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
    exit 1
fi

if [ ! -d $SOURCE_DIRECTORY ]  # if -d $SOURCE_DIRECTORY is true and the ! make it false
then
    echo "$SOURCE_DIRECTORY doesn not exist..please check"
else
    echo "$SOURCE_DIRECTORY exists"
fi

if [ ! -d $DESTINATION_DIRECTORY ]
then
    echo "$DESTINATION_DIRECTORY doesn not exist..please check"
else
    echo "$DESTINATION_DIRECTORY exists"
fi

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)

echo "Files: $FILES"

if [ ! -z $FILES] # -z prints true if FILES is empty, then ! makes the expression false
then              # -z is true when it is empty, ! makes it false means non-empty, so this condition says files are found
    echo "Files are found"
    # ZIP_FILES="$DESTINATION_DIRECTORY/logs-$TIMESTAMP.zip"
    # find ${SOURCE_DIRECTORY} -name "*.log" -mtime +14 | zip "$ZIP_FILES" -@

    # #check if the zip file is successfully created or not
    # if [ -f $ZIP_FILES ]
    # then
    #     echo "Successfully zipped files older then $DAYS"
    #     while IFS= read -r file               
    #     do                                   
    #         echo "Deleting file: $file"
    #         rm -rf $file
    #     done <<< $FILES
    # else
    #     echo "Zipping the files is failed"
    #     exit 1
    # fi
else
    echo "No files older than $DAYS"
fi




