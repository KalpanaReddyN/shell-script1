#!/bin/bash

#Display top 5 frequntly repeated words
#Write a shell script that reads a text file and counts the occurrences of each word, display the top 5 most #frequent words along with their counts.


if [ $# -eq 0 ]
then
    echo "USAGE: $0 <filename>"
    exit 1
fi

cat $1 | tr -c '[:alnum:]' '[\n*]' | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -nr | head -5

