#!/bin/bash

if [ "$#" -eq 2 ];then

        if [ -d ./$1 ]; then
                if [ -d ./$1/$(dirname $2) ]; then
                        if [ -e  ./$1/$(dirname $2)/$(basename $2) ]; then
				if [ -f ./$1/$(dirname $2)/$(basename $2) ];then
					rm -rf  ./$1/$(dirname $2)/$(basename $2)
        	                        echo  "Ok: File removed successfully"
	                                exit 0
				else
					echo "Error:File not found"
					exit 1

				fi
                        else
                                echo "Error: Service not found"
                                exit 1
                        fi

                else
                        echo "ERROR: Service not found"
                        exit 1
                fi
        else
                echo "Error: The user ${1} does not exists"
                exit 1

        fi

elif [ "$#" -gt 2 ];then
        echo "Error: Too many arguments please pass two argument" >&2
        exit 1

else
        echo "Error: Please pass two argument" >&2
        exit 1

fi












