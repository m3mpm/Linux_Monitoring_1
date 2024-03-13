#!/bin/bash
# (1 - white, 2 - red, 3 - green, 4 - blue, 5 – purple, 6 - black)

color_f () {
case ${argument1} in
    1) 
    column1_bg='\033[107m'
    background_color_name=' (white)';;
    2) 
    column1_bg='\033[41m'
    background_color_name=' (red)';;
    3) 
    column1_bg='\033[42m'
    background_color_name=' (green)';;
    4) 
    column1_bg='\033[44m'
    background_color_name=' (blue)';;
    5) 
    column1_bg='\033[45m'
    background_color_name=' (purple)';;
    6) 
    column1_bg='\033[40m'
    background_color_name=' (black)';;
esac

case ${argument2} in
    1) 
    column1_font='\033[1;97m'
    font_color_name=' (white)';;
    2) 
    column1_font='\033[1;31m'
    font_color_name=' (red)';;
    3) 
    column1_font='\033[1;32m'
    font_color_name=' (green)';;
    4) 
    column1_font='\033[1;34m'
    font_color_name=' (blue)';;
    5) 
    column1_font='\033[1;35m'
    font_color_name=' (purple)';;
    6) 
    column1_font='\033[1;30m'
    font_color_name=' (black)';;
esac

case ${argument3} in
    1) 
    column2_bg='\033[107m'
    background_color_value=' (white)';;
    2) 
    column2_bg='\033[41m'
    background_color_value=' (red)';;
    3) 
    column2_bg='\033[42m'
    background_color_value=' (green)';;
    4) 
    column2_bg='\033[44m'
    background_color_value=' (blue)';;
    5) 
    column2_bg='\033[45m'
    background_color_value=' (purple)';;
    6) 
    column2_bg='\033[40m'
    background_color_value=' (black)';;
esac

case ${argument4} in
    1) 
    column2_font='\033[1;97m'
    font_color_value=' (white)';;
    2) 
    column2_font='\033[1;31m'
    font_color_value=' (red)';;
    3) 
    column2_font='\033[1;32m'
    font_color_value=' (green)';;
    4) 
    column2_font='\033[1;34m'
    font_color_value=' (blue)';;
    5) 
    column2_font='\033[1;35m'
    font_color_value=' (purple)';;
    6) 
    column2_font='\033[1;30m'
    font_color_value=' (black)';;
esac
}
