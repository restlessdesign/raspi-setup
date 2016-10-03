#!/bin/bash

# Ensure program is run via sudo
if [ "$(whoami)" != "root" ]; then
    echo "This script must be run as the root user"
    exit 1
fi

if [[ $DELETE_DEFAULT_USER == true ]]; then
    echo "Deleting default user…"
    deluser --remove-all-files pi
    echo "Default user deleted."
fi
