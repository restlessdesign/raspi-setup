#!/bin/bash

# Ensure program is run via sudo
if [ "$(whoami)" != "root" ]; then
    echo "This script must be run as the root user"
    exit 1
fi

echo ""
echo "#============================="
echo "# NETWORK SETUP"
echo "#============================="
echo ""

# Setup network
read -p "Setup wireless network? [Y/n] " setup_wireless
setup_wireless=${setup_wireless,,} # convert response to lowercase
if [[ $setup_wireless =~ ^(yes|y)$ ]]; then
    read -p "Network (SSID): " nw_ssid
    read -sp "Password: " nw_pass

    cat >> /etc/wpa_supplicant/wpa_supplicant.conf <<EOF
network={
    ssid=\"${nw_ssid}\"
    psk=\"${$nw_pass}\"
}
EOF

    echo "Using ${$nw_ssid} for WiFi"
    echo ""
fi

# Change hostname (a network full of “raspberrypi”s isn’t very helpful!)
read -p "Setup hostname? [Y/n] " setup_hostname
setup_hostname=${setup_hostname,,}
if [[ $setup_hostname =~ ^(yes|y)$ ]]; then
    read -p "Hostname: " hn

    sed -i "s/raspberrypi/${hn}/" /etc/hosts
    sed -i "s/raspberrypi/${hn}/" /etc/hostname

    sudo /etc/init.d/hostname.sh
    echo "Hostname changed to “${hn}”"
    echo ""
fi

# @todo
# Set up static IP address?
# Hostnames seem to work just fine though…

echo "Network setup complete!"
