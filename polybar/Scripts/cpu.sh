temperature=$(sensors | grep "CPU" | awk '{print $2}')

cpuIdle=`top -b -n 1 | grep Cpu | awk '{print $8}'|cut -f 1 -d "."`
cpuUsage=$(( 100 - $cpuIdle ))
echo "$cpuUsage% $temperature"

