#!/bin/bash

# check params here

if [ "$#" -eq 1 ]; then
	while ! mkdir "$1.lock" 2>/dev/null; do
        	sleep 1
	done
	exit 0
else
	exit 1
fi
