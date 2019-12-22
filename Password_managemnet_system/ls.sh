#!/bin/bash

if [ "$#" -le 2 ];then
	if [ "$2" = "empty" ]; then
		if [ -d ./$1 ]; then
                	tree -a ./$1
                	exit 0
        	else
                	echo "Error: The user ${1} does not exists"
                	exit 1

        	fi

	else
		if [ -d ./$1/$2 ]; then
                	tree -a ./$1/$2
                	exit 0
        	else
                	echo "Error: The service ${2} does not exists"
                	exit 1

        	fi

	fi

elif [ "$#" -gt 2 ];then
        echo "Error: Too many arguments please pass two argument" >&2
        exit 1

else
        echo "Error: Please pass two argument" >&2
        exit 1

fi






