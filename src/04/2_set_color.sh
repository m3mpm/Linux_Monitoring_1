#!/bin/bash

# set color scheme function
function set_color_f () {
    # check color_scheme.conf file exists or not
    # echo "start set_color_f" # !delete
    if [[ -f ./color_scheme.conf ]]; then
        default_color_flag=0
    else
        default_color_flag=1
    fi

    # read color from color_scheme.conf
    if [[ $default_color_flag -eq 0 ]]; then
        argument1=$(grep column1_background ./color_scheme.conf | awk -F "=" '{print $2}')
        argument2=$(grep column1_font_color ./color_scheme.conf | awk -F "=" '{print $2}')
        argument3=$(grep column2_background ./color_scheme.conf | awk -F "=" '{print $2}')
        argument4=$(grep column2_font_color ./color_scheme.conf | awk -F "=" '{print $2}')
    fi

    # check if one of parameters is empty
    if [[ -z "$argument1" || -z "$argument2" || -z "$argument3" || -z "$argument4" ]]; then
        default_color_flag=1
    fi

    # # another way to check if one of four parametes is empty
    # if [[ $column1_bg == '' || $column1_font == '' || $column2_bg == '' || $column2_font == '' ]]; then
    #     default_color_flag=1
    #     echo $default_color_flag
    # fi

    # check enter only digits from 1 to 6 and $1 != $2, !3 != $4
    check_f $argument1 $argument2 $argument3 $argument4
    error_check_f="$?"
    if [[ $error_check_f -eq 1 ]]; then
        default_color_flag=1
    fi

    export column1_bg
    export column1_font
    export column2_bg
    export column2_font
    export default_color_flag

    # set color scheme based on configuration file or default arguments
    if [[ $default_color_flag -eq 0 ]]; then
        color_f $argument1 $argument2 $argument3 $argument4
    else
        argument1=$(grep column1_background ./color_scheme_default.conf | awk -F "=" '{print $2}')
        argument2=$(grep column1_font_color ./color_scheme_default.conf | awk -F "=" '{print $2}')
        argument3=$(grep column2_background ./color_scheme_default.conf | awk -F "=" '{print $2}')
        argument4=$(grep column2_font_color ./color_scheme_default.conf | awk -F "=" '{print $2}')

        color_f $argument1 $argument2 $argument3 $argument4
    fi
}
