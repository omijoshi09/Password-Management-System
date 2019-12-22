
#!/bin/bash

if [ "$#" -eq 4 ] ;then
        if [ -d ./$1 ]; then
                if [ -d ./$1/$(dirname $2) ]; then
                        if [ "$3" == 'f' ] && [  -e  ./$1/$(dirname $2)/$(basename $2) ];then
                                echo "$4" > ./$1/$(dirname $2)/$(basename $2)
                                echo "OK: Service has been updated"
                                exit 0
                         else
                                if [ -e  ./$1/$(dirname $2)/$(basename $2) ]; then
                                        echo "Error: The service ${2} is already exists"
                                        exit 1
                                else
                                        echo "$4" >  ./$1/$(dirname $2)/$(basename $2)
                                        echo "OK: Service created !"
                                        exit 0
                                fi
                         fi

                else
                        mkdir ./$1/$(dirname $2)
                        echo "$4" > ./$1/$(dirname $2)/$(basename $2)
                        echo "OK: Service created !!"
                        exit 0
                fi
        else
                echo "Error: The user ${1} does not exists"
                exit 1
        fi

elif [ "$#" -gt 4 ];then
        echo "Error: Too many arguments" >&2
        exit 1

else
        echo "Error: Please pass require argument" >&2
        exit 1

fi







