#!/bin/bash
#
#Variables
cpuCORES=$(nproc)
cpuTOTAL="$(($cpuCORES*100))"
cpuCURRENT=$(uptime | cut -c54-57)
cpuAVERAGE=$(uptime | cut -c40-69)
MESSAGE=""
#If-Else / Logic
checkIT () {
if [[ $cpuCURRENT < "scale=2;($cpuCORES/2)|bc" ]] ; then
	MESSAGE="<font color=\"#FF0000\">LOAD is OK.</font> Number of cores is: $cpuCORES. Current CPU is $cpuCURRENT. Average CPU is: $cpuAVERAGE"
else
	MESSAGE="<font color=\"#00FF00\">LOAD is NOT OK.</font> Number of cores is: $cpuCORES. Current CPU is $cpuCURRENT. Average CPU is: $cpuAVERAGE"
fi
}

#PushOver Notification
criticalIT () {
if [[ $cpuCURRENT < "scale=2;($cpuCORES/2)|bc" ]] ; then
curl -s \
  --form-string "token=awky6pxfixs9ysh3tne3httwr4ka1d" \
  --form-string "user=uwucoy827zv1b95hwssmpsw19xpro3" \
  --form-string "html=1" \
  --form-string "message=$MESSAGE" \
  https://api.pushover.net/1/messages.json
fi
}
#

checkIT
criticalIT
