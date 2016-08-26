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

# @todo
# Prompt user for email frequency (daily or weekly)

echo "Where should daily logwatch emails be sent?"
read -p "Email: " email
echo "/usr/sbin/logwatch --output mail --mailto ${email} --detail high" >> /etc/cron.daily/00logwatch

# @todo
# Ensure that cron is actually running and sending mails

echo "Logwatch setup complete!"
