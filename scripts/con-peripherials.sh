#!/bin/bash

function connect_device() {
  local DEVICE_MAC="$1"
  
  local connected=$(bluetoothctl devices | grep -o "$DEVICE_MAC")

  if [[ "$connected" == "$DEVICE_MAC" ]]; then
    echo "Device is already connected."
  else
    echo "Connecting to $DEVICE_MAC"
    bluetoothctl connect "$DEVICE_MAC"
    echo "Done"
  fi
}

LIFT=D9:14:DF:3F:1B:13
MX_KEYS=D9:14:DF:3F:1B:13

connect_device "$LIFT"
connect_device "$MX_KEYS"


