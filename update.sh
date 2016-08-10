#!/bin/bash

if [ "$(whoami)" != "root" ]; then
    echo "This script must be run as the root user"
    exit 1
fi

# Update firmware
rpi-update

# Update packages
apt-get update
apt-get -y dist-upgrade

# Install common packages
apt-get -y install vim
