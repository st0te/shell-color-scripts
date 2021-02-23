#!/bin/bash

# Author: Stote
#
# This script is based on Derek Taylor's shell color script
# which is available at this link: https://gitlab.com/dwt1/shell-color-scripts
# I just took the scripts that I liked.
# Each scripts has their info inside them
#
# This script will execute one of the scripts in the scripts directory at random
#

# Store the current script directory
typeset -r script_dir="$( cd "$(dirname "$0")" >/dev/null 2>&1 && pwd -P )"

# Store the color scripts directory and check if exists
typeset -r color_scripts_dir="$script_dir/scripts"
[ ! -d $color_scripts_dir ] && echo "$color_scripts_dir not found" && exit 1

# List the scripts inside the directory and store the output in an array
typeset -r color_scripts=($(/usr/bin/ls $color_scripts_dir))

# No need to explain.. Or not
typeset -ri total_scripts=$(/usr/bin/ls $color_scripts_dir | wc -l )
typeset -ri random_index=$[ $RANDOM % $total_scripts + 1 ]
typeset -r selected_script=${color_scripts[$random_index]}

# Display script name and execute it
echo $selected_script
exec "$color_scripts_dir/$selected_script"
