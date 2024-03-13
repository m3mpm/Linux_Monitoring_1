#!/bin/bash

check_f () {
local error=0
local count=0
regex="^[1-6]$"

for param in "$@"
do
    if [[ $param =~ $regex ]]; then
        count=$(( $count+1 ))
    else
        error=1
        break;
    fi
done

# check if $1==$2 && $3==$4
if [[ $count -eq 4 ]]; then
    if [[ $1 -eq $2 || $3 -eq $4 ]]; then
        error=1
    fi
fi
return $(( $error ))
}
