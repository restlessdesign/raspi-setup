#!/bin/bash

# Ensure program is run via sudo
if [ "$(whoami)" != "root" ]; then
    echo "This script must be run as the root user"
    exit 1
fi

echo ""
echo "#============================="
echo "# FIREWALL SETUP"
echo "#============================="
echo ""

# Allow SSH globally
ufw allow 22

# Allow connections from local network
ufw allow from 192.168.1.0/24

ufw --force enable

echo "Firewall setup complete! UFW Status is as follows:"
echo ""
ufw status
