#!/bin/bash
#
#This is the handler to put in cron.d and is responsible for running the single scripts
checkIT () {
	./MEM/critical_mem.sh
	./CPU/critical_cpu.sh
	./PING/critical_ping.sh
}
checkIT
