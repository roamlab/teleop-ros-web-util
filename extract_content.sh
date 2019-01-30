#!/bin/bash
# extract all of the server content to server folder location, usually /var/www/html
src_path=$(pwd)
ros3d_dir="/ros3djs"
roslib_dir="/roslibjs"
server_content_root="/var/www/html"
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

