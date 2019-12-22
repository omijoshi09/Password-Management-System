#!/bin/bash

 	case "$2" in
                init)
			if [ $# -eq 3 ]; then
				mkfifo "$1.pipe"
	                        ./P.sh $1
        	                op="init $3 $1"
                	        echo "$op" > server.pipe
                        	read op1 < "$1.pipe"
                      	 	./V.sh $1
                        	echo "$op1"
                        	rm -rf "$1.pipe"

			else
				echo "Please pass require argument"
			fi
                        ;;
                insert)
			if [ $# -eq 4 ]; then
				echo "Please enter your username: "
				read username
				echo "Please enter your password: "
				read password
				payload="login:$username/password:$password"
				mkfifo "$1.pipe"
                        	./P.sh $1
				empty_string="empty"
                        	oi="insert $3 $4 $empty_string $payload $1"
                        	echo "$oi" > server.pipe
                        	read oi1 < "$1.pipe"
                        	./V.sh $1
                        	echo "$oi1"
                        	rm -rf "$1.pipe"
  			else
      				echo "Please pass require argument"
  			fi
                        ;;
                show)
			if [ $# -eq 4 ]; then
				mkfifo "$1.pipe"
                        	./P.sh $1
                        	os="show $3 $4 $1"
                        	echo "$os" > server.pipe
                        	read os1 < "$1.pipe"
				full_login="$(cut -d'/' -f1 <<<"$os1")"
                                full_pass="$(cut -d'/' -f2 <<<"$os1")"
                                login="$(cut -d':' -f2 <<<"$full_login")"
				password="$(cut -d':' -f2 <<<"$full_pass")"
				full_string="$4"
				search_string="/"
				replace_string="."
				path_string=${full_string/$search_string/$replace_string}
                                echo "${3}'s login for $path_string is: $login"
				echo "${3}'s password for $path_string is: $password"
                        	./V.sh $1
                        	rm -rf "$1.pipe"

                        else
                                echo "Please pass require argument"
                        fi
                        ;;
                update)
			if [ $# -eq 5 ]; then
				./P.sh $1
				mkfifo "$1.pipe"
				os="show $3 $4 $1"
                                echo "$os" > server.pipe
                                read os1 < "$1.pipe"
                                full_login="$(cut -d'/' -f1 <<<"$os1")"
                                full_pass="$(cut -d'/' -f2 <<<"$os1")"
				tmp_file=$(mktemp)
				echo "$full_login" >> $tmp_file
				echo "$full_pass" >> $tmp_file
				nano $tmp_file
				new_pass=$(sed -n '2p' < $tmp_file)
				new_login=$(sed -n '1p' < $tmp_file)
				seprator="/"
				new_payload="${new_login}${seprator}${new_pass}"
				rm -rf "$tmp_file"
				rm -rf "$1.pipe"
				echo "$new_payload"

				mkfifo "$1.pipe"
                        	ou="update $3 $4 $5 $new_payload $1"
                        	echo "$ou" > server.pipe
                        	read ou1 < "$1.pipe"
                        	./V.sh $1
                        	echo "$ou1"
                        	rm -rf "$1.pipe"

                        else
                                echo "Please pass require argument"
                        fi
                        ;;
                rm)
			if [ $# -eq 4 ]; then
				mkfifo "$1.pipe"
	                        ./P.sh $1
        	                or="rm $3 $4 $1"
                	        echo "$or" > server.pipe
                        	read or1 < "$1.pipe"
                        	./V.sh $1
                        	echo "$or1"
                        	rm -rf "$1.pipe"
                        else
                                echo "Please pass require argument"
                        fi
			;;
	        ls)
			if [ $# -ge 3 ] && [ $# -le 4 ]; then
				mkfifo "$1.pipe"
	                        ./P.sh $1
				if [ -z "$4" ]; then
                                        empty="empty"
					ols="ls $3 $empty $1"
				else
					ols="ls $3 $4 $1"
				fi
                	        echo "$ols" > server.pipe
                        	#read ols1 < "$1.pipe"
				while read p
				do
					echo "$p"
				done < $1.pipe
				#cat $1.pipe
                        	./V.sh $1
                        	#echo "$ols1"
                        	rm -rf "$1.pipe"

                        else
                                echo "Please pass require argument"
                        fi
			;;
	shutdown)
			if [ $# -eq 2 ]; then
				mkfifo "$1.pipe"
				./P.sh $1
				oshut="shut $1"
				echo "$oshut" > server.pipe
				read os1 < "$1.pipe"
				./V.sh $1
				echo "$os1"
				rm -rf "$1.pipe"
			else
				echo "Please pass require argument"
			fi
			;;
                *)
                        echo "Error: bad request"

	esac


