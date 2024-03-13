#!/bin/bash

print_color_scheme_f () {
if [[ ${default_color_flag} = 0 ]]
    then
        echo ""
        echo -e "Column 1 background = ${argument1}${background_color_name}"
        echo -e "Column 1 font color = ${argument2}${font_color_name}"
        echo -e "Column 2 background = ${argument3}${background_color_value}"
        echo -e "Column 2 font color = ${argument4}${font_color_value}"                
    else
        echo
        echo -e "Column 1 background = default${background_color_name}"
        echo -e "Column 1 font color = default${font_color_name}"
        echo -e "Column 2 background = default${background_color_value}"
        echo -e "Column 2 font color = default${font_color_value}"                
fi
}
