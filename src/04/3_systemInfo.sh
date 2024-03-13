#!/bin/bash

systemInfo_f () {
NORMAL='\033[0m'
echo "System info: "
hostname=$(hostname)
echo -e "${column1_bg}${column1_font}HOSTNAME${NORMAL}        = ${column2_bg}${column2_font}$hostname ${NORMAL}"

tz=$(cat /etc/timezone)
tzhour=$(date +%:::z)
echo -e "${column1_bg}${column1_font}TIMEZONE${NORMAL}        = ${column2_bg}${column2_font}$tz UTC $tzhour ${NORMAL}"

username=$(whoami)
echo -e "${column1_bg}${column1_font}USER${NORMAL}            = ${column2_bg}${column2_font}$username ${NORMAL}"

typeos=$(uname -o)
versionos=$(cat /etc/issue | awk '{print $1 $2 $3}')
echo -e "${column1_bg}${column1_font}OS${NORMAL}              = ${column2_bg}${column2_font}$typeos $versionos ${NORMAL}"

datetime=$(date +"%e %B %Y %T")
echo -e "${column1_bg}${column1_font}DATE${NORMAL}            = ${column2_bg}${column2_font}$datetime ${NORMAL}"

uptime=$(uptime -p)
echo -e "${column1_bg}${column1_font}UPTIME${NORMAL}          = ${column2_bg}${column2_font}$uptime ${NORMAL}"

uptime_sec=$(awk '{ print $1}' /proc/uptime)
echo -e "${column1_bg}${column1_font}UPTIME_SEC${NORMAL}      = ${column2_bg}${column2_font}$uptime_sec seconds ${NORMAL}"

# 2> /dev/null: don't show errors on display
ip=$(hostname -I | awk '{ print $1}')
echo -e "${column1_bg}${column1_font}IP${NORMAL}              = ${column2_bg}${column2_font}$ip ${NORMAL}"

# 2> /dev/null: don't show errors on display
mask=$(ifconfig | grep $ip | awk '{print $4}')
echo -e "${column1_bg}${column1_font}MASK${NORMAL}            = ${column2_bg}${column2_font}$mask ${NORMAL}"

# 2> /dev/null: don't show errors on display
gatway=$(ip r | grep default | awk '{print $3}')
echo -e "${column1_bg}${column1_font}GATEWAY${NORMAL}         = ${column2_bg}${column2_font}$gatway ${NORMAL}"

# bc -lq: #include <math.h>
ram_total_KB=$(free --kilo | grep Mem | awk '{ print $2 }' ) # total ram memory in kilobyte
ram_total_Gb=$(echo "scale=3;$ram_total_KB/1024/1024" | bc -lq) # total ram memory in gigabyte
echo -e "${column1_bg}${column1_font}RAM_TOTAL${NORMAL}       = ${column2_bg}${column2_font}$ram_total_Gb Gb ${NORMAL}"

ram_used_KB=$(free --kilo | grep Mem | awk '{ print $3 }' ) # used ram memory in kilobyte
ram_used_Gb=$(echo "$ram_used_KB/(1024*1024)" | bc -lq) # used ram memory in gigabyte
echo -e "${column1_bg}${column1_font}RAM_USED${NORMAL}        = ${column2_bg}${column2_font}$(printf "%.3f\n" $ram_used_Gb) Gb ${NORMAL}"

ram_free_KB=$(free --kilo | grep Mem | awk '{ print $4 }' ) # free ram memory in kilobyte
ram_free_Gb=$(echo "$ram_free_KB/(1024*1024)" | bc -lq) # free ram memory in gigabyte
echo -e "${column1_bg}${column1_font}RAM_FREE${NORMAL}        = ${column2_bg}${column2_font}$(printf "%.3f\n" $ram_free_Gb) Gb ${NORMAL}"

space_root_KB=$(df | grep "^/dev/[^loop]" | awk '{print $2}')
space_root_Mb=$(echo "$space_root_KB/1024" | bc -lq)
echo -e "${column1_bg}${column1_font}SPACE_ROOT${NORMAL}      = ${column2_bg}${column2_font}$(printf "%.2f\n" $space_root_Mb) Mb ${NORMAL}"

space_root_used_KB=$(df | grep "^/dev/[^loop]" | awk '{print $3}')
space_root_used_Mb=$(echo "$space_root_used_KB/1024" | bc -lq)
echo -e "${column1_bg}${column1_font}SPACE_ROOT_USED${NORMAL} = ${column2_bg}${column2_font}$(printf "%.2f\n" $space_root_used_Mb) Mb ${NORMAL}"

space_root_free_KB=$(df | grep "^/dev/[^loop]" | awk '{print $3}')
space_root_free_Mb=$(echo "$space_root_free_KB/1024" | bc -lq)
echo -e "${column1_bg}${column1_font}SPACE_ROOT_FREE${NORMAL} = ${column2_bg}${column2_font}$(printf "%.2f\n" $space_root_free_Mb) Mb ${NORMAL}"
}
