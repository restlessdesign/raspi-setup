#!/bin/bash

# Ensure program is run via sudo
if [ "$(whoami)" != "root" ]; then
    echo "This script must be run as the root user"
    exit 1
fi

read -p "Gmail Address: " gmail_address
read -s -p "Gmail Password: " gmail_password

echo "Updating /etc/ssmtp/ssmtp.conf with Gmail login…"
sed -i "s/root=postmaster/root=${gmail_address}/" /etc/ssmtp/ssmtp.conf
sed -i "s/mailhub=mail/mailhub=smtp.gmail.com:587/" /etc/ssmtp/ssmtp.conf
sed -i "s/#rewriteDomain=/rewriteDomain=gmail.com/" /etc/ssmtp/ssmtp.conf
sed -i "s/#FromLineOverride=YES/FromLineOverride=YES/" /etc/ssmtp/ssmtp.conf

echo "
AuthUser=${gmail_address}
AuthPass=${gmail_password}
UseTLS=YES
UseSTARTTLS=YES
  hostname=smtp.gmail.com:587
" >> /etc/ssmtp/ssmtp.conf

echo "Done."
echo ""
echo "Mail setup complete! Remember to enable less secure apps (https://www.google.com/settings/security/lesssecureapps)"

read -p "Press [Enter] to continue…"
