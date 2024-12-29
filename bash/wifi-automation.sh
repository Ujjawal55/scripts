#!/bin/bash

# Author: Ujjawal Kumar
# Date of Creation: 2024-11-12
# Description: Trying to automate the process of connection to the wifi...
# Date of Updation: 2024-11-12


echo "starting the scripts"

check_pre_connect=$(nmcli device wifi list)
user_choice=0

if [ -z "$check_pre_connect" ]; then
  # redirect the output of the command to the /dev/null
  nmcli device disconnect wlan0 > /dev/null

  # check if the status of the previous command is success or not..

  if [ $? -eq 0 ]; then
    echo "Device is ready for connection...."
    echo
    
    read -p "Enter the wifi ssid name: " ssid_name
    
    if nmcli connection show | grep "$ssid_name"; then
      nmcli connection up "$ssid_name"
      if [ $? -eq 0 ]; then 
        echo "connection successfull"
      else
        echo "some issue happens"

        # check what is the command to break the script

    else
      nmcli device wifi connect "$ssid_name" -a

      if [ $? -eq 0 ]; then
        ehco "connection successfully"

      else
        echo "password is wrong"

  else
    echo "some error with disconnecting wlan0...."


