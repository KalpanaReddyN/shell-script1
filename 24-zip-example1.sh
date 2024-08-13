#!/bin/bash

# Define variables
SOURCE_DIR="/tmp/app-logs"  # Directory containing old files
DEST_DIR="/tmp/backups"  # Directory to store the zip file
FILE_TYPE="*.log"
DAYS_OLD=14  # Number of days to consider files as old
ZIP_FILE_NAME="old_files_$(date +%Y%m%d).zip"  # Name of the zip file with date

# Ensure the destination directory exists
if [ ! -d "$DEST_DIR" ]; then
  mkdir -p "$DEST_DIR"
fi

# Find old files and zip them
find "$SOURCE_DIR" -type f -name "$FILE_TYPE" -print | zip -@ "$DEST_DIR/$IP_FILE_NAME"          # install zip -- sudo yum install zip

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




