#!/usr/bin/env bash

BASH_CONFIG_PATH="$HOME/.config/bashConfig"

for file in "$BASH_CONFIG_PATH"/*.sh; do
  [ -f "$file" ] && source "$file"
done

clear
fastfetch
