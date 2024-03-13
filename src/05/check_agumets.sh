#!/bin/bash

# check arguments
function check_agumets () {
# check how many arguments have been entered
if [[ ${all_args} -eq 0 || ${all_args} -gt 1 ]]
then
    echo "Input invalid: Enter one arguments like /path/folder/. Pls, try again."; exit 1
fi

regex="/$"
if [[ ${first_arg} =~ ${regex} ]]
then
    if [[ -d ${first_arg} ]]; then # check is file folder or not
        export folder=${first_arg}
    else
        echo "Error: The folder doesn't exist! Pls, try again."; exit 3
    fi    
else
    echo "Input invalid: The path must be include / in the end.  Pls, try again."; exit 2
fi
}
