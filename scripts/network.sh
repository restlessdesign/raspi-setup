#!/bin/bash

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

    echo "Using ${$nw_ssid} for WIFI"
fi

# Change hostname (a network full of “raspberrypi”s isn’t very helpful!)
read -p "Setup hostname? [Y/n]\n" setup_hostname
setup_hostname=${setup_hostname,,}
if [[ $setup_hostname =~ ^(yes|y)$ ]]; then
    read -p "Hostname: " hn

    sed -i "s/raspberrypi/${hn}/" /etc/hosts
    sed -i "s/raspberrypi/${hn}/" /etc/hostname

    sudo /etc/init.d/hostname.sh
    echo "Hostname changed to “${hn}”"
fi

# @todo
# Set up static IP address
