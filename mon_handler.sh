#!/bin/bash
#
#This is the handler to put in cron.d and is responsible for running the single scripts
checkIT () {
	./MEM/mem.sh
	./CPU/cpu.sh
	./PING/ping.sh
}
checkIT
