#!/bin/bash

# Prompt the user for input
res=$(shead -s -o "N" -o "Y" -p "Enter your response (y/n):")

# Check the value of res
if [[ "$res" == "y" || "$res" == "Y" ]]; then
  shutdown now
elif [[ "$res" == "n" || "$res" == "N" ]]; then
  echo "ok no prob"
else
  echo "wrong key"
fi
