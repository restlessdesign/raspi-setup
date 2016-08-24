#!/bin/bash

# Ensure program is run via sudo
if [ "$(whoami)" != "root" ]; then
    echo "This script must be run as the root user"
    exit 1
fi

echo "Updating keyboard layout…"
sed -i "s/XKBLAYOUT=\"gb\"/XKBLAYOUT=\"us\"/" /etc/default/keyboard

echo "Updating timezone…"
cp /usr/share/zoneinfo/America/New_York /etc/localtime
