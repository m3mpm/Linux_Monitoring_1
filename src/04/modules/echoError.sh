#!/bin/bash

# list of errors
argumentsIs="Input invalid: Don't enter parameters"

# errors from Part 3
# zeroParameters="Input invalid: You've entered zero parameters. You should enter four parameters. Please, try again."
# incorrectNumberOfParameters="Invalid input: You should enter four parameters. Enter 4 digits from 1 to 6 for each parameter. Please, try again."
# incorrectParameters="Invalid input: Please, enter only digit from 1 to 6 for each parameter. Default color scheme will be used."
# sameColorBackFront="Invalid input: Background color and font color should not match. Default color scheme will be used."

# print error function
echoError_f () {
    echo $@ >&2
}