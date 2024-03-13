#!/bin/bash

# include all modules
. ./echoError.sh
. ./check.sh
. ./color.sh
. ./systemInfo.sh

check_f $@
error_check_f="$?"
if [[ error_check_f -eq 0 ]]; then
    color_f $@
    systemInfo_f
fi


