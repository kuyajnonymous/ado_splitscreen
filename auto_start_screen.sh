#!/bin/bash

# Clear the screen
clear

# Display IP address
echo "IP Address"
echo "$(curl -s ifconfig.me)"

# Display AdoPiSoft Terminal Login information
echo -e "\nAdoPiSoft Terminal Login"
echo "username: adoadmin"
echo "password: AdoPiSoft"

# Start screen session
screen -dmS htop_session

# Split screen vertically (-v) with 30% for the top part and 70% for the bottom part
screen -S htop_session -X split -v -p 30

# Select the bottom split and start htop
screen -S htop_session -X focus bottom
screen -S htop_session -X screen -t htop_screen htop

# Select the top split and display the static information
screen -S htop_session -X focus top
echo "Static Information"
echo "IP Address"
echo "$(curl -s ifconfig.me)"
echo -e "\nAdoPiSoft Terminal Login"
echo "username: adoadmin"
echo "password: AdoPiSoft"

# Pause briefly to display information
sleep 10

# Attach to the screen session to view both splits
screen -r htop_session
