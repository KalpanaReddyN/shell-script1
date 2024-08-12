#!/bin/bash

# Define variables
SOURCE_DIR="/app-logs"  # Directory containing old files
DEST_DIR="/var/backups"  # Directory to store the zip file
DAYS_OLD=14  # Number of days to consider files as old
ZIP_NAME="old_files_$(date +%Y%m%d).zip"  # Name of the zip file with date

# Find old files and zip them
find "$SOURCE_DIR" -type f -mtime +$DAYS_OLD -print | zip -@ "$DEST_DIR/$ZIP_NAME"

# Optional: Delete the original files after zipping
# Uncomment the following line if you want to remove the original files
# find "$SOURCE_DIR" -type f -mtime +$DAYS_OLD -delete

echo "Old files have been zipped and moved to $DEST_DIR/$ZIP_NAME"

