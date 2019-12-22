#!/bin/bash

if [ "$#" -eq 1 ];then
	if [ -d ./$1 ]; then
  		 echo 'The user already exists'
		exit 1
	else
		mkdir ./$1
		echo 'OK: User created'
		exit 0

	fi

elif [ "$#" -eq 0 ];then
	echo "Error: Please pass require argument" >&2
	exit 1

else
	echo "Error: Argument error" >&2
	exit 1

fi
