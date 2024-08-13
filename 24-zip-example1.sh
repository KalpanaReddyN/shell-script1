#!/bin/bash

# Define variables
SOURCE_DIR="/tmp/app-logs"  # Directory containing old files
DEST_DIR="/tmp/new-zip-example"  # Directory to store the zip file
FILE_TYPE="*.log"
ZIP_FILE_NAME="old_files_$(date +%Y%m%d).zip"  # Name of the zip file with date

# Ensure the destination directory exists
if [ ! -d "$DEST_DIR" ]; then
  mkdir -p "$DEST_DIR"
fi

# Find old files and zip them
find "$SOURCE_DIR" -type f -name "$FILE_TYPE" -mtime +14 -print | zip -@ "$DEST_DIR/$ZIP_FILE_NAME"          # install zip -- sudo yum install zip

# Optional: Delete the original files after zipping
# Uncomment the following line if you want to remove the original files
# find "$SOURCE_DIR" -type f -mtime +$DAYS_OLD -delete


# Check if the zip operation was successful
if [ $? -eq 0 ]; then
  echo "Selected files have been zipped and saved to $DEST_DIR/$ZIP_FILE_NAME"
else
  echo "Error: Failed to zip the files."
  exit 1
fi



#SOURCE_DIR: The directory where the files are located.
#DEST_DIR: The directory where you want to save the zip file.
#FILE_TYPE: The type of files you want to zip, such as *.log, *.txt, or any other file extension.
#ZIP_FILE_NAME: The name of the resulting zip file, which includes the current date.
#find "$SOURCE_DIR" -type f -name "$FILE_TYPE" -mtime +14:

#-type f: Finds regular files.
#-name "$FILE_TYPE": Matches files of the specified type (e.g., *.log).
#-mtime +14: Finds files that were modified more than 14 days ago.
#-print: Prints the names of the files found, which are then piped to the zip command.
#zip "$DEST_DIR/$ZIP_FILE_NAME" -@: The -@ option tells zip to read the list of files to be zipped from standard input, which is provided by the find command.

