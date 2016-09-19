#!/bin/bash

# Ensure program is run via sudo
if [ "$(whoami)" != "root" ]; then
    echo "This script must be run as the root user"
    exit 1
fi

echo ""
echo "#============================="
echo "# LOGWATCH SETUP"
echo "#============================="
echo ""

echo "Where should daily logwatch emails be sent?"
read -p "Email: " email
cat >> /etc/cron.daily/00logwatch <<EOF
/usr/sbin/logwatch --output mail --mailto ${email} --detail high
EOF

echo "Logwatch setup complete!"
