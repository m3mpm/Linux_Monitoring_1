#!/bin/bash

echo "System info: "
hostname=$(hostname)
echo "HOSTNAME = $hostname"

tz=$(cat /etc/timezone)
tzhour=$(date +%:::z)
echo "TIMEZONE = $tz UTC $tzhour"

username=$(whoami)
echo "USER = $username"

typeos=`uname -o`
versionos=`cat /etc/issue`
echo "OS = $typeos $versionos"

datetime=$(date +"%e %B %Y %T")
echo "DATE = $datetime"

uptime=$(uptime -p)
echo "UPTIME = $uptime"

uptime_sec=$(awk '{ print $1}' /proc/uptime)
echo "UPTIME_SEC = $uptime_sec seconds"

# 2> /dev/null: don't show errors on display
ip=$(hostname -I | awk '{ print $1}')
echo "IP = $ip"

# 2> /dev/null: don't show errors on display
mask=$(ifconfig | grep $ip | awk '{print $4}')
echo "MASK = $mask"

# 2> /dev/null: don't show errors on display
gatway=$(ip r | grep default | awk '{print $3}')
echo "GATEWAY = $gatway"

# bc -lq: #include <math.h>
ram_total_KB=$(free --kilo | grep Mem | awk '{ print $2 }' ) # total ram memory in kilobyte
ram_total_Gb=$(echo "$ram_total_KB/1024/1024" | bc -lq) # total ram memory in gigabyte
echo "RAM_TOTAL = $(printf "%.3f\n" $ram_total_Gb) Gb"
# ram_total_Gb=$(echo "scale=3;$ram_total_KB/1024/1024" | bc -lq) # total ram memory in gigabyte
# echo "RAM_TOTAL = $ram_total_Gb Gb"

ram_used_KB=$(free --kilo | grep Mem | awk '{ print $3 }' ) # used ram memory in kilobyte
ram_used_Gb=$(echo "$ram_used_KB/(1024*1024)" | bc -lq) # used ram memory in gigabyte
echo "RAM_USED = $(printf "%.3f\n" $ram_used_Gb) Gb"

ram_free_KB=$(free --kilo | grep Mem | awk '{ print $4 }' ) # free ram memory in kilobyte
ram_free_Gb=$(echo "$ram_free_KB/(1024*1024)" | bc -lq) # free ram memory in gigabyte
echo "RAM_FREE = $(printf "%.3f\n" $ram_free_Gb) Gb"

space_root_KB=$(df | grep "^/dev/[^loop]" | awk '{print $2}')
space_root_Mb=$(echo "$space_root_KB/1024" | bc -lq)
echo "SPACE_ROOT = $(printf "%.2f\n" $space_root_Mb) Mb"

space_root_used_KB=$(df | grep "^/dev/[^loop]" | awk '{print $3}')
space_root_used_Mb=$(echo "$space_root_used_KB/1024" | bc -lq)
echo "SPACE_ROOT_USED = $(printf "%.2f\n" $space_root_used_Mb) Mb"

space_root_free_KB=$(df | grep "^/dev/[^loop]" | awk '{print $3}')
space_root_free_Mb=$(echo "$space_root_free_KB/1024" | bc -lq)
echo "SPACE_ROOT_FREE = $(printf "%.2f\n" $space_root_free_Mb) Mb"
