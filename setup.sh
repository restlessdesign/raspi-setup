#!/bin/bash

# Force sudo
if [ "$(whoami)" != "root" ]; then
    echo "This script must be run as the root user"
    exit 1
fi

# Setup network
read -p "Setup wireless network? [Y/n]\n" setup_wireless
setup_wireless=${setup_wireless,,} # convert response to lowercase
if [[ $setup_wireless =~ ^(yes|y)$ ]]; then
    read -p "Network (SSID): " nw_ssid
    read -sp "Password: " nw_pass

    echo "
        network={
            ssid=\"$nw_ssid\"
            psk=\"$nw_pass\"
        }
    " >> /etc/wpa_supplicant/wpa_supplicant.conf
fi

# Update keyboard
sed -i "s/XKBLAYOUT=\"gb\"/XKBLAYOUT=\"us\"/" /etc/default/keyboard

# Update timezone
cp /usr/share/zoneinfo/America/New_York /etc/localtime

# Copy aliases
if [ ! -f ~/.bash_aliases]; then
    cp .bash_aliases ~/.bash_aliases
fi

# Move setup script to temporary directory (for easy access after rebooting)
mkdir ~/tmp && cp setup.sh ~/tmp/setup.sh

# Reboot for network and keyboard changes to take effect
reboot
