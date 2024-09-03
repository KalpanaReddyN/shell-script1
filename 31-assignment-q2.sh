#!/bin/bash

# Check if the file argument is provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 file.txt"
  exit 1
fi

input_file="$1"

# Convert the file into a format suitable for transposing
# Step 1: Convert spaces to tabs for easy processing
tr ' ' '\t' < "$input_file" |
# Step 2: Transpose the lines by treating tabs as delimiters
# We need to align columns first
paste -sd '\t' - |
# Step 3: Convert tabs back to spaces and print
# Split the transposed line into columns and print each as a row
tr '\t' ' ' |
# Step 4: Print each row correctly formatted
{
  line_number=0
  while IFS= read -r line; do
    # Increase line_number to handle transposition
    ((line_number++))
    echo "$line" |
    # Extract and print each column from the transposed line
    {
      column_number=1
      while IFS= read -r column; do
        if [ "$column_number" -eq 1 ]; then
          echo -n "$column"
        else
          echo -n " $column"
        fi
        ((column_number++))
      done <<< "$line"
      echo
    }
  done
}
