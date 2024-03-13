#!/bin/bash

# include all modules
. ./check_agumets.sh



time_start="$(cat /proc/uptime | awk '{print$1}')"
export all_args=${#}
export first_arg=${1}
check_agumets
# Total number of folders (including all nested ones)
total_number_of_folders=$(ls -lR "$folder" 2>/dev/null | grep -c '^d')
echo "Total number of folders (including all nested ones) = $total_number_of_folders"

# TOP 5 folders of maximum size arranged
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
top_5_folders="$(du -h --max-depth 1 "$folder" 2>/dev/null | sort -hr | sed -n '2,6p' | awk '{printf "%d - %s, %s\n", NR, $2, $1}' | sed 's/K/ Kb/; s/M/ Mb/; s/G/ Gb/g')"
echo "$top_5_folders"

# Total number of files
total_number_of_files=$(ls -lR "$folder" 2>/dev/null | grep -c '^-')
echo "Total number of files = $total_number_of_files"

# Number of .conf, .txt, .log, archive, sybmol links files
echo "Number of: "
number_config_files=$(ls -lahR "$folder" 2>/dev/null | grep -c '.conf')
echo "Configuration files (with the .conf extension) = $number_config_files"
number_of_text_files=$(ls -lahR "$folder" 2>/dev/null | grep -c '.txt')
echo "Text files = $number_of_text_files"
number_of_exec_files=$(find "$folder" -type f -executable 2>/dev/null | wc -l)
echo "Executable files = $number_of_exec_files"
number_of_log_files=$(ls -lhaR $folder 2>/dev/null | grep -c '.log')
echo "Log files (with the extension .log) = $number_of_log_files"
number_archive_files="$(find "$folder" -type f -name "*.zip" -o -name "*.7z" -o -name "*.rar" -o -name "*.tar" -o -name "*.gz" -o -name "*.arj" 2>/dev/null | wc -l)"
echo "Archive files = $number_archive_files"
number_of_symbolic_links=$(find "$folder" -type l 2>/dev/null | wc -l)
echo "Symbolic links = $number_of_symbolic_links"

# TOP 10 files of maximum size
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
top_10_files=$(find "$folder" -type f -not -path '*/\.*' -exec du -h {} + 2> /dev/null | sort -hr | head -n 10 | awk -F '\t' '{split($2, a, "."); printf "%d - %s, %s, %s\n", NR, $2, $1, a[2]}' | sed 's/K/ Kb/; s/M/ Mb/; s/G/ Gb/g')
echo "$top_10_files"

# TOP 10 executable files
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
top_10_exec_files="$(find "$folder" -type f -executable -exec du -h {} + 2>/dev/null | sort -hr | head -10 | awk '{print $2}')"
arr_files=($top_10_exec_files)
top_10_exec_files_size="$(find "$folder" -type f -executable -exec du -h {} + 2>/dev/null | sort -hr | head -10 | awk '{print $1}' | sed 's/K/Kb/; s/M/Mb/; s/G/Gb/g')"
arr_size=($top_10_exec_files_size)
for (( i = 0; i < 10; i++ )); do
	printf "%d - " $(( i + 1 )); printf "${arr_files[$i]}, "; printf "${arr_size[$i]}, "
	if [[  -n ${arr_files[$i]} ]] ; then
		export hash="$(md5sum ${arr_files[$i]} | awk '{print $1}')"; printf "$hash"
	fi
	printf "\n"
done
time_end="$(cat /proc/uptime | awk '{print$1}') - $time_start"
time_work=$(echo $time_end | bc)
printf "Script execution time (in seconds): %.2f\n" $time_work