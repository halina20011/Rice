#!/bin/bash

info=""

#echo $(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master))
master=($(amixer sget Master | grep "Mono:"))
status=${master[${#master[@]}-1]}
 
if [[ ${status} == "[off]" ]]; then
    info=off
elif [[ ${status} == "[on]" ]];then
    info=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master))
fi
echo $info
# exit 0
