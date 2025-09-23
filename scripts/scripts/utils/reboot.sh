#!/bin/bash

# Prompt the user for input
read -p "Enter your response (y/n): " res

# Check the value of res
if [[ "$res" == "y" || "$res" == "Y" ]]; then
  reboot
elif [[ "$res" == "n" || "$res" == "N" ]]; then
  echo "ok no prob"
else
  echo "wrong key"
fi
