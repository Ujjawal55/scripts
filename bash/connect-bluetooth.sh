#!/bin/bash

# Author: Ujjawal Kumar
# Date of Creation: 2024-10-29
# Description: Trying to automate the process of the bluetooth connect
# Date of Updation: 2024-10-29

declare choice
# echo -e "disconnect\nquit" | bluetoothctl
echo -e "disconnect\nquit" | bluetoothctl

# Initialize bluetooth with all commands in sequence
echo -e "power on\nagent on\nscan on\ndevices\nquit" | bluetoothctl

if [ $? -eq 0 ]; then
	# Get the list of devices
	devices_arr=$(echo -e "devices\nquit" | bluetoothctl | head -n 5)
	echo "$devices_arr"
	mapfile -t devices_arr < <(echo -e "devices\nquit" | bluetoothctl | grep "Device" | head -n 5)
	for i in "${!devices_arr[@]}"; do
		echo "$((i + 1)) ${deviecs_arr[$i]}"
	done
else
	echo "Failed to execute bluetooth commands"
fi
