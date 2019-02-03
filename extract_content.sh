#!/bin/bash
# extract all of the server content to server folder location, usually /var/www/html
src_path=$(pwd)
ros3d_dir="/ros3djs"
roslib_dir="/roslibjs"
server_content_root="/var/www/html"
# read all options
while [ -n "$1" ]; do # while loop starts
	case "$1" in
    	-i) 
			ip_address="$2"
			echo "ip adress to host: $ip_address"
        	shift
        	;;
        --)
        	shift # The double dash makes them parameters
        	break
        	;;
    	*) echo "Option $1 not recognized" ;;
    esac
    shift
done

# copy libraries needed
mkdir -p "$server_content_root/build" 
cd "$src_path$ros3d_dir/build"
echo "Extracting: $(pwd)"
cp * "$server_content_root/build"
cd "$src_path$roslib_dir/build"
echo "Extracting: $(pwd)"
cp * "$server_content_root/build"
# copy page of marker_control
mkdir -p "$server_content_root/examples"
cd "$src_path$ros3d_dir/examples"
echo "Extracting: $(pwd)"
cp marker_control.html "$server_content_root/examples"
cp -r resources "$server_content_root/examples"
# copy page of monitor
cd "$src_path$roslib_dir/examples"
echo "Extracting: $(pwd)"
cp -r user-monitor "$server_content_root/examples"
# checkout the default files

# replace the default ip address 127.0.0.1
if [ -z "$ip_address" ] 
then
	echo "No dedicated ip address specified, 127.0.0.1 is used by default."
else
	echo "$ip_address is used"
	sed -i "s/127.0.0.1/$ip_address/g" \
	"$server_content_root/examples/user-monitor/buttons_event.js"
	sed -i "s/127.0.0.1/$ip_address/g" \
	"$server_content_root/examples/user-monitor/monitor.html"
	sed -i "s/127.0.0.1/$ip_address/g" \
	"$server_content_root/examples/marker_control.html"
fi
