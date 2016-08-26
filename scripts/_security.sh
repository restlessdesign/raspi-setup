#!/bin/bash

# Ensure program is run via sudo
if [ "$(whoami)" != "root" ]; then
    echo "This script must be run as the root user"
    exit 1
fi

echo ""
echo "#============================="
echo "# SECURITY SETUP"
echo "#============================="
echo ""

# Create new user
echo "Where should daily logwatch emails be sent?"
read -p "Email: " email
echo "/usr/sbin/logwatch --output mail --mailto ${email} --detail high" >> /etc/cron.daily/00logwatch

# @todo
# Set up MFA
# https://www.digitalocean.com/community/tutorials/how-to-protect-ssh-with-two-factor-authentication
# https://www.digitalocean.com/community/tutorials/how-to-set-up-multi-factor-authentication-for-ssh-on-ubuntu-14-04

echo "Security setup complete!"
