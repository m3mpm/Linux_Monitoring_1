#!/bin/bash
# (1 - white, 2 - red, 3 - green, 4 - blue, 5 – purple, 6 - black)

color_f () {
case $1 in
    1) column1_bg='\033[107m';;
    2) column1_bg='\033[41m';;
    3) column1_bg='\033[42m';;
    4) column1_bg='\033[44m';;
    5) column1_bg='\033[45m';;
    6) column1_bg='\033[40m';;
esac

case $2 in
    1) column1_font='\033[1;97m';;
    2) column1_font='\033[1;31m';;
    3) column1_font='\033[1;32m';;
    4) column1_font='\033[1;34m';;
    5) column1_font='\033[1;35m';;
    6) column1_font='\033[1;30m';;
esac

case $3 in
    1) column2_bg='\033[107m';;
    2) column2_bg='\033[41m';;
    3) column2_bg='\033[42m';;
    4) column2_bg='\033[44m';;
    5) column2_bg='\033[45m';;
    6) column2_bg='\033[40m';;
esac

case $4 in
    1) column2_font='\033[1;97m';;
    2) column2_font='\033[1;31m';;
    3) column2_font='\033[1;32m';;
    4) column2_font='\033[1;34m';;
    5) column2_font='\033[1;35m';;
    6) column2_font='\033[1;30m';;
esac

}