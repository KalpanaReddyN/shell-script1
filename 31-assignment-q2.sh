#!/bin/bash

# Check if a file is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

# File to transpose
file=$1

# Transpose the content
cat "$file" | tr ' ' '\n' | fmt -1 | paste -s -d' ' -