#!/bin/bash

# check arguments
function check_agumets_f () {
    if [[ -n "$1" ]]; then
    echoError_f $argumentsIs; exit 1
fi
}
