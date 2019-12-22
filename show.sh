#!/bin/bash
if [ "$#" -eq 2 ];then
        if [ -d ./$1 ]; then
                if [ -d ./$1/$(dirname $2) ] && [ $(dirname $2) != "." ]; then
                        if [ -e  ./$1/$(dirname $2)/$(basename $2) ]; then
                                cat  ./$1/$(dirname $2)/$(basename $2)
                                exit 0
                        else
                                echo "Error: Service not found"
                                exit 1
                        fi

                else
			 if [ -e  ./$1/$(basename $2) ]; then
                                cat  ./$1/$(basename $2)
                                exit 0
                        else
                                echo "Error: Service not found"
                                exit 1
                        fi
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




