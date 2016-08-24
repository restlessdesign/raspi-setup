#!/bin/bash

# Ensure program is run via sudo
if [ "$(whoami)" != "root" ]; then
    echo "This script must be run as the root user"
    exit 1
fi

# Copy aliases if safe to do so
if [ ! -f ~/.bash_aliases]; then
    cp ../dotfiles/.bash_aliases ~/.bash_aliases
else
    echo "~/.bash_aliases already exists. Skipping…"
fi
