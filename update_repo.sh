#!/bin/bash
# update all submodules
# Assuming you are at the arm_teleop_ur5 directory level
git pull
git submodule update --init --recursive
src_path=$(pwd)
ros3d_dir="/ros3djs"
roslib_dir="/roslibjs"
cd "$src_path$ros3d_dir"
echo "Updating: $(pwd)"
git checkout develop
git pull
cd "$src_path$roslib_dir"
echo "Updating: $(pwd)"
git checkout develop
git pull
cd "$src_path"
