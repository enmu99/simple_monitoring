#!/bin/bash
#
#Memory usage check

#Variables
varIT () {
memTOTAL=$(top -bn 1 | grep "MiB Mem" | cut -c14-16)
memFREE=$(top -bn 1 | grep "MiB Mem" | cut -c30-32)
memUSED=$(top -bn 1 | grep "MiB Mem" | cut -c45-47)
memBUFF=$(top -bn 1 | grep "MiB Mem" | cut -c60-62)
MESSAGE=""
}
#IF-ELSE Statement / Logic
countIT () {
if [[ "$memFREE" < "$(($memTOTAL-($memTOTAL/2)))" ]] ; then
	MESSAGE="<font color=\"#FF0000\">NOT OK.</font> There are less than 50% memory free: TOTALMEM: $memTOTAL M, MEMUSED: $memUSED M, MEMFREE: $memFREE M, MEMBUFF: $memBUFF M"
else
	MESSAGE="<font color=\"#00FF00\">OK.</font> There are more than 50% memory free: TOTALMEM: $memTOTAL M, MEMUSED: $memUSED M, MEMFREE: $memFREE M, MEMBUFF: $memBUFF M."
fi
}
#PushOver request
#CriticalPush Notification
criticalIT () {
if [[ "$memFREE" < "$(($memTOTAL-($memTOTAL/2)))" ]] ; then
curl -s \
  --form-string "token=awky6pxfixs9ysh3tne3httwr4ka1d" \
  --form-string "user=uwucoy827zv1b95hwssmpsw19xpro3" \
  --form-string "html=1" \
  --form-string "message=$MESSAGE" \
  https://api.pushover.net/1/messages.json
}
fi
#Functions Call
varIT
countIT
criticalIT
