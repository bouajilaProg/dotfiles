#!/bin/bash

set -euo pipefail
exec 2>/dev/null

CONF="$HOME/bouajilascripts/utils/wifi-share/wifi.conf"
CONF="${BASH_SOURCE[0]%/*}/wifi.conf"

NAME=""
INTERFACE=""
PASSWORD=""

die() {
  echo "$1"
  exit 1
}

read_conf() {
  [[ -f "$CONF" ]] || die "wifi.conf not found"

  # shellcheck disable=SC1090
  source "$CONF"

  NAME="${name:-}"
  INTERFACE="${interface:-}"
  PASSWORD="${passwd:-}"

  [[ -n "$NAME" && -n "$INTERFACE" && -n "$PASSWORD" ]] ||
    die "Invalid wifi.conf (missing values)"
}

set_conf() {
  local key="$1"
  local value="$2"

  sed -i "s|^$key=.*|$key=$value|" "$CONF"
}

wifi_exists() {
  nmcli -t -f NAME connection show | grep -qx "$NAME"
}

wifi_stop() {
  read_conf
  wifi_exists && nmcli connection delete "$NAME"
}

wifi_start() {
  read_conf

  wifi_exists && wifi_stop

  nmcli connection add \
    type wifi \
    ifname "$INTERFACE" \
    mode ap \
    con-name "$NAME" \
    ssid "$NAME" \
    ipv4.method shared

  nmcli connection modify "$NAME" \
    802-11-wireless-security.key-mgmt wpa-psk \
    802-11-wireless-security.psk "$PASSWORD" \
    802-11-wireless.cloned-mac-address random

  nmcli connection up "$NAME"
}

wifi_restart() {
  read_conf
  nmcli connection down "$NAME" || true
  nmcli connection up "$NAME"
}

wifi_info() {
  nmcli dev wifi show
}

# Main

case "${1:-}" in
start)
  echo "Starting Wi-Fi hotspot"
  wifi_start
  ;;

stop)
  echo "Stopping Wi-Fi hotspot"
  wifi_stop
  ;;

restart)
  echo "Restarting Wi-Fi hotspot"
  wifi_restart
  ;;

set)
  wifi_stop
  sleep 1

  case "${2:-}" in
  -n | --name)
    set_conf name "$3"
    ;;
  -i | --interface)
    set_conf interface "$3"
    ;;
  -p | --password)
    set_conf passwd "$3"
    ;;
  *)
    die "Unknown set option"
    ;;
  esac

  wifi_start
  ;;

info)
  wifi_info
  ;;

help | -h)
  cat <<EOF
Usage: wifi-share [start|stop|restart|set|info|help]

Commands:
  start        Start hotspot
  stop         Stop hotspot
  restart      Restart hotspot
  info         Show Wi-Fi info

Set options:
  set -n NAME        Set SSID
  set -i INTERFACE   Set interface
  set -p PASSWORD    Set password
EOF
  ;;

*)
  die "Unknown command"
  ;;
esac
