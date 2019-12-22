#!/bin/bash


while true; do
read input < server.pipe
input_array=($input)
	case "${input_array[0]}" in
		init)
			op=$(./init.sh "${input_array[1]}")
			echo "$op" > "${input_array[2]}.pipe"
			;;
		insert)
			oi=$(./insert.sh "${input_array[1]}" "${input_array[2]}" "${input_array[3]}" "${input_array[4]}")
			echo "$oi" > "${input_array[5]}.pipe"
			;;
		show)
			os_value=$(./show.sh "${input_array[1]}" "${input_array[2]}")
			echo "$os_value" > "${input_array[3]}.pipe"
			;;
		update)

			ou_value=$(./insert.sh "${input_array[1]}" "${input_array[2]}" "${input_array[3]}" "${input_array[4]}")
                        echo "$ou_value" > "${input_array[5]}.pipe"
			;;
		rm)
			or_value=$(./rm.sh "${input_array[1]}" "${input_array[2]}")
                        echo "$or_value" > "${input_array[3]}.pipe"
			;;
		ls)
			ols_value=$(./ls.sh "${input_array[1]}" "${input_array[2]}")
                        echo "$ols_value" > "${input_array[3]}.pipe"
			;;
	     shut)
                        shutdown_value="Server is shutting down!!"
                        echo "$shutdown_value" > "${input_array[1]}.pipe"
			break
                        ;;

		*)
			echo "Error: bad request"
			exit 1
	esac
done
