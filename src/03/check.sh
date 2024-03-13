#!/bin/bash

#  include print error function
. ./echoError.sh

check_f () {
error=1
if [[ $# -eq 4 ]]; then
    local count=0
    regex="^[1-6]$"
    for param in "$@"
    do
        if [[ $param =~ $regex ]]; then
            count=$(( $count+1 ))
        else
            echoError_f $incorrectParameters; # exit 1
            break;
        fi
    done

    if [[ $count -eq 4 ]]; then
        if [[ $1 -eq $2 || $3 -eq $4 ]]; then
            echoError_f $sameColorBackFront; # exit 1
        else
            error=0;
        fi
    fi
elif [[ $# -lt 4 || $# -gt 4 ]] && [[ $# -ne 0 ]]; then
    echoError_f $incorrectNumberOfParameters; # exit 1
else
    echoError_f $zeroParameters; # exit 1
fi
return $(( $error ))
}