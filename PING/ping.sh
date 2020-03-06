#!/bin/bash
#to ping HOST 5 times within each hour
#to output success / failed

#Variables
#
#HOST variable. Can be changed to any host you like.
variables () {
touch b
HOST="google.com"
#Message dummy variable to store the Success/Failed message upon ping and be used in the PushOver request.
MESSAGE=""
#Variable to store the transmitted packets line from ping and pass it to PushOver request.
#Ping variable, grepping only successful output and passing it to the text file ping_output.
PING=$(ping -c 5 "$HOST")
PINGPUSH=''
}
#FUNCTIONS
pingIT () {
if [[ $PING != *"0 received"* ]] ; then
	echo "" > b
	MESSAGE="<font color=\"#00FF00\">OK</font>"
	#ping -c 1 "$HOST" | grep "transmitted" > PINGPUSH
	PINGPUSH=$(ping -c 5 "$HOST" | grep "transmitted")
else
	echo "" > b
	MESSAGE="<font color=\"#FF0000\">Not OK</font>"
	#ping -c 1 "$HOST" | grep "transmitted" > PINGPUSH
	PINGPUSH=$(ping -c 5 "$HOST" | grep "transmitted")
fi
}
pushIT () {
#PushOver request
curl -s \
  --form-string "token=awky6pxfixs9ysh3tne3httwr4ka1d" \
  --form-string "user=uwucoy827zv1b95hwssmpsw19xpro3" \
  --form-string "html=1" \
  --form-string "message=$MESSAGE $echo $PINGPUSH" \
  https://api.pushover.net/1/messages.json
}


variables
pingIT
pushIT
