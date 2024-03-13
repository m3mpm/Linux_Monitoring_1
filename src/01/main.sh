#!/bin/bash

if [[ $# -eq 1 ]]; then
    if [[ $1 =~ ^[a-zA-Z]+$ ]]; then
    echo $1
    else
    echo "Invalid input: You should enter only letters"
    fi
elif [[ $# -gt 1 ]]; then
echo "Invalid input: You've entered more than 1 parameter"
else
echo "Invalid input: You have entered 0 parameters"
fi
