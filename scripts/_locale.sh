#!/bin/bash

# Ensure program is run via sudo
if [ "$(whoami)" != "root" ]; then
    echo "This script must be run as the root user"
    exit 1
fi

echo "raspi-config is the safest way to set your locale, keyboard, and timezone."
read -p " Press [Enter] to continue…"

