#!/bin/bash

# Ensure program is run via sudo
if [ "$(whoami)" != "root" ]; then
    echo "This script must be run as the root user"
    exit 1
fi

./scripts/user.sh
./scripts/locale.sh
./scripts/network.sh
./scripts/dotfiles.sh

# Move setup script to temporary directory (for easy access after rebooting)
mkdir ~/tmp && cp setup.sh ~/tmp/setup.sh

# Reboot for network and keyboard changes to take effect
reboot
