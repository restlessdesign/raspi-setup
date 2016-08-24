#!/bin/bash

echo "Updating keyboard layout…"
sed -i "s/XKBLAYOUT=\"gb\"/XKBLAYOUT=\"us\"/" /etc/default/keyboard

echo "Updating timezone…"
cp /usr/share/zoneinfo/America/New_York /etc/localtime
