#!/bin/bash

# Ensure program is run via sudo
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
apt-get -y install fail2ban
apt-get -y install htop
apt-get -y install logwatch
# @todo
# echo "/usr/sbin/logwatch --output mail --mailto kevinsweeney@gmail.com --detail high" >> /etc/cron.daily/00logwatch
apt-get -y install vim
apt-get -y install xclip
