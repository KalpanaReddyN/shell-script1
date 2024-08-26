#!/bin/bash

MOVIES=("RRR" "DjTillu" "murari")

# size of above array is 3.
# index are 0,1,2

# list always starts with 0.

echo "First Movie is: ${MOVIES[0]}"
echo "First Movie is: ${MOVIES[1]}"
echo "First Movie is: ${MOVIES[@]}"


students=("kalpana" "vijaya" "sarada" "rajeswari")
echo "First rank student is: ${students[0]}"
echo "All passed students is: ${students[@]}"
