#!/bin/bash

# Ensure program is run via sudo
if [ "$(whoami)" != "root" ]; then
    echo "This script must be run as the root user"
    exit 1
fi

echo ""
echo "#============================="
echo "# SYSTEM UPDATE"
echo "#============================="
echo ""

echo "Updating Raspberry Pi firmware and packages"

# Update firmware
rpi-update

# Update packages
apt-get update
apt-get -y dist-upgrade

echo "System update complete!"
