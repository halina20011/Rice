batteryCapacity=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)
#echo $batteryCapacity $status

#         0   10  20  30  40   50  60  70  80  90  100
battery=("" "" "" "" "" "" "" "" "" "" "")
# Battery=("" "" "" "" "" "" "" "" "" "" "")

index=$(( $batteryCapacity / 10 ))

payload="$batteryCapacity% "

if [[ $status == "Full" || $status == "Discharging" ]]; then
    # payload+=${battery[10]}
    payload+="${battery[${index}]}"

# elif [[ $status == "Discharging" ]]; then
elif [[ $status == "Charging" ]]; then
    payload+=""
fi

echo ${payload}
