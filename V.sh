#!/bin/bash

if [ "$#" -eq 1 ];then
	rm -rf $1.lock
	exit 0
else
	exit 1
fi
