#!/bin/bash

# Ensure program is run via sudo
if [ "$(whoami)" != "root" ]; then
    echo "This script must be run as the root user"
    exit 1
fi

./scripts/dotfiles.sh
./scripts/locale.sh
./scripts/network.sh

# Move the rest of our scripts somewhere local
mkdir ~/tmp && cp scripts/ ~/tmp/scripts

# Reboot for network and keyboard changes to take effect
reboot
