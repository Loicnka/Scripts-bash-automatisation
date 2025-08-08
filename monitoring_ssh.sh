#!/bin/bash

MAX_CONNEXIONS=5
NBR_CONNEXIONS=$(who | grep ssh | wc -l)

echo "Number of ssh connections running: $NBR_CONNEXIONS"

if [ "$NBR_CONNEXIONS" -gt "$MAX_CONNEXIONS" ]; then
  echo "Too many SSH connections: $NBR_CONNEXIONS"
else
  echo "SSH connections are within the limits."
fi
