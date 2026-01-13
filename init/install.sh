#!/bin/bash

# download packages
sudo pacman -S --needed $(grep -vE '^\s*#' pacman-packages.txt)
./package.sh

# add services
