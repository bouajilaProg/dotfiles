#!/bin/bash

#
notify-send "Connecting to $selected"
# Get the list of Wi-Fi SSIDs and their security types
wifiList=$(nmcli -t -f SSID,SECURITY dev wifi)

# Initialize an array
wifiArray=()

# Parse the Wi-Fi list into an array
while IFS= read -r line; do
  ssid=$(echo "$line" | cut -d':' -f1)
  security=$(echo "$line" | cut -d':' -f2)
  wifiArray+=("$ssid:$security")
done <<<"$wifiList"

# Prepare input for rofi
rofiInput=$(printf "%s\n" "${wifiArray[@]}" | sed 's/:/ (/' | sed 's/$/)/')

# Display the list in rofi and capture the selected entry
selected=$(echo -e "$rofiInput" | rofi -dmenu -p "Select Wi-Fi:")

# Check if a selection was made
if [[ -z $selected ]]; then
  echo "No selection made."
  exit 1
fi

# Extract the SSID and security
chosenSSID=$(echo "$selected" | sed 's/ (.*)//')
security=$(echo "$selected" | sed -n 's/.*(\(.*\))$/\1/p')

# Check if the network has security
if [[ $security == "--" || $security == "NONE" ]]; then
  echo "Connecting to open network: $chosenSSID"
  nmcli dev wifi connect "$chosenSSID"
  exit $?
fi

nmcli dev wifi connect "$chosenSSID" --ask
# # Prompt for the Wi-Fi password using rofi (one-time)
# password=$(rofi -dmenu -password -p "Enter password for $chosenSSID:")
#
# # If no password was provided, exit
# if [[ -z $password ]]; then
#   echo "No password provided. Connection aborted."
#   exit 1
# fi
#
# # Attempt to connect using nmcli
# nmcli dev wifi connect "$chosenSSID" password "$password"
# if [[ $? -eq 0 ]]; then
#   echo "Connected successfully to $chosenSSID."
# else
#   echo "Failed to connect to $chosenSSID."
# fi
#
# kill $$
