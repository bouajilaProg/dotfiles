#!/bin/bash

exec 2>/dev/null
name=$(head -n 1 ~/bouajilascripts/utils/wifi-share/wifi.conf | tr "=" "\n" | tail -n 1)
interface=$(head -n 3 ~/bouajilascripts/utils/wifi-share/wifi.conf | tail -n 1 | tr "=" "\n" | tail -n 1)
password=$(head -n 4 ~/bouajilascripts/utils/wifi-share/wifi.conf | tail -n 1 | tr "=" "\n" | tail -n 1)

function readConf() {
  name=$(head -n 1 ~/bouajilascripts/utils/wifi-share/wifi.conf | tr "=" "\n" | tail -n 1)
  interface=$(head -n 3 ~/bouajilascripts/utils/wifi-share/wifi.conf | tail -n 1 | tr "=" "\n" | tail -n 1)
  password=$(head -n 4 ~/bouajilascripts/utils/wifi-share/wifi.conf | tail -n 1 | tr "=" "\n" | tail -n 1)
}

if [ ! -f ~/bouajilascripts/utils/wifi-share/wifi.conf ]; then
  echo "wifi.conf not found"
  exit 1
fi

function stopWifi() {
  nmcli connection delete "$name"
}

function startWifi() {
  readConf
  if [ -n "$(nmcli device wifi list | grep 'zwawin')" ]; then
    stopWifi
  fi
  nmcli connection add type wifi ifname "$interface" mode ap con-name "$name" ssid "$name" ipv4.method shared
  nmcli connection modify "$name" 802-11-wireless-security.key-mgmt wpa-psk
  nmcli connection modify "$name" 802-11-wireless-security.psk "$password"
  nmcli connection modify "$name" 802-11-wireless.cloned-mac-address random
  nmcli connection up "$name"
}

case "$1" in
"start")
  echo "Starting the wireless network"
  startWifi
  ;;

"stop")
  echo "Stopping the wireless network $name"
  stopWifi
  ;;

"restart")
  echo "Restarting the wireless network"
  nmcli connection down "$name"
  nmcli connection up "$name"
  ;;

"set")
  stopWifi
  sleep 1
  case "$2" in
  "-n" | "--name")
    echo "Setting the network name"
    sed -i "s/name=.*/name=$3/" ~/bouajilascripts/utils/wifi-share/wifi.conf
    ;;
  "-i" | "--interface")
    echo "Setting the network interface"
    sed -i "s/interface=.*/interface=$3/" ~/bouajilascripts/utils/wifi-share/wifi.conf
    ;;
  "-p" | "--password")
    echo "Setting the network password"
    sed -i "s/passwd=.*/passwd=$3/" ~/bouajilascripts/utils/wifi-share/wifi.conf
    ;;
  esac
  startWifi

  ;;

"info")
  nmcli dev wifi show
  ;;

"help" | "-h")
  echo "Usage: wifi-share.sh [start|stop|restart|set|users|help]"
  echo "start: Start the wireless network"
  echo "stop: Stop the wireless network"
  echo "restart: Restart the wireless network"
  echo "set: Set the network name, interface or password"
  echo "  -n, --name: Set the network name"
  echo "  -i, --interface: Set the network interface"
  echo "  -p, --password: Set the network password"
  echo "info: Show the wireless network information"
  echo "help: Show this help message"
  ;;
*)
  echo "unkown command"
  ;;
esac
