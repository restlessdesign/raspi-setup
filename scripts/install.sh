#!/bin/bash

# Ensure program is run via sudo
if [ "$(whoami)" != "root" ]; then
    echo "This script must be run as the root user"
    exit 1
fi

# Install common packages
apt-get -y install fail2ban
apt-get -y install htop
apt-get -y install logwatch
apt-get -y install vim
apt-get -y install xclip
