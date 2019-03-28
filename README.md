ROS web utilities for teleoperation
======================================

## Replace IP address
Before hosting the web contents, make sure to replace the ip adresses of **127.0.0.1** in the following files:
* ros3djs/examples/marker_control.html
* roslibjs/examples/user-monitor/monitor.html
* roslibjs/examples/user-monitor/buttons_event.js

## Extract content to Apache2 folder
Navigate to root folder, and then run  
`sudo bash extract_content.sh -i <ip_address>`

