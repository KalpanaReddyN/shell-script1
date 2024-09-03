#!/bin/bash

# Check if a file is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

# File to transpose
file=$1

# Transpose the content
awk '
{
    for (i = 1; i <= NF; i++) {
        a[NR,i] = $i
    }
}
NF > p { p = NF }
END {
    for(j = 1; j <= p; j++) {
        for(i = 1; i <= NR; i++) {
            printf "%s ", a[i,j]
        }
        printf "\n"
    }
}' "$file"

