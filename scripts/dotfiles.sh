#!/bin/bash

# Copy aliases if safe to do so
if [ ! -f ~/.bash_aliases]; then
    cp ../dotfiles/.bash_aliases ~/.bash_aliases
else
    echo "~/.bash_aliases already exists. Skipping…"
fi
