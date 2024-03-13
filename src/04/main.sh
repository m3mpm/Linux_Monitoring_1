#!/bin/bash

# include all modules
. ./1_check_agumets.sh
. ./2_set_color.sh
. ./3_systemInfo.sh
. ./4_print_color_scheme.sh
. ./modules/echoError.sh
. ./modules/check.sh
. ./modules/color.sh

check_agumets_f $@
set_color_f
systemInfo_f
print_color_scheme_f
