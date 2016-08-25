#!/bin/bash

# Ensure program is run via sudo
if [ "$(whoami)" != "root" ]; then
    echo "This script must be run as the root user"
    exit 1
fi

./scripts/_locale.sh
./scripts/_network.sh

# Move the rest of our scripts somewhere local
mkdir ~/tmp && cp scripts/ ~/tmp/scripts

echo "Locale and network settings updated!"
echo "The system will now reboot. Once it does, continue installation by running ~/tmp/scripts/setup.sh"
echo ""

# Reboot for network and keyboard changes to take effect
read -p "Press [Enter] to reboot machine"
reboot
