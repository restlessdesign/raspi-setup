#!/bin/bash

# Ensure program is run via sudo
if [ "$(whoami)" != "root" ]; then
    echo "This script must be run as the root user"
    exit 1
fi

echo ""
echo "#============================="
echo "# APPLICATION INSTALLATION"
echo "#============================="
echo ""

echo "Installing common applications…"

apt-get -y install fail2ban
apt-get -y install htop
apt-get -y install libpam-google-authenticator
apt-get -y install logwatch
apt-get -y install ssmtp
apt-get -y install ufw
apt-get -y install vim

echo "Application installation complete!"
