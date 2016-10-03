#!/bin/bash

# Ensure program is run via sudo
if [ "$(whoami)" != "root" ]; then
    echo "This script must be run as the root user"
    exit 1
fi

echo ""
echo "#============================="
echo "# MAIL SERVER SETUP"
echo "#============================="
echo ""

echo "You will now be asked for your Gmail login. Remember:"
echo "  1. Use a Gmail account *other* than your personal account!"
echo "  2. Enable less secure apps (https://www.google.com/settings/security/lesssecureapps)"
echo ""

read -p "Press [Enter] to continue…"

read -p "Gmail Address (including @gmail.com): " gmail_address
read -s -p "Gmail Password: " gmail_password

echo "Updating /etc/ssmtp/ssmtp.conf with Gmail login…"
sed -i "s/root=postmaster/root=${gmail_address}/" /etc/ssmtp/ssmtp.conf
sed -i "s/mailhub=mail/mailhub=smtp.gmail.com:587/" /etc/ssmtp/ssmtp.conf
sed -i "s/#rewriteDomain=/rewriteDomain=gmail.com/" /etc/ssmtp/ssmtp.conf
sed -i "s/#FromLineOverride=YES/FromLineOverride=YES/" /etc/ssmtp/ssmtp.conf

cat > /etc/ssmtp/ssmtp.conf <<EOF
root=mailservice.pi@gmail.com
mailhub=smtp.gmail.com:587

FromLineOverride=YES
AuthUser=${gmail_address}
AuthPass=${gmail_password}
UseSTARTTLS=YES
UseTLS=YES
EOF

echo "Done."
echo ""

echo "Mail setup complete!"
