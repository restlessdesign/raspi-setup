#!/bin/bash

# Ensure program is run via sudo
if [ "$(whoami)" != "root" ]; then
    echo "This script must be run as the root user"
    exit 1
fi

read -p "Create new user? [Y/n]\n" create_user
create_user=${create_user,,}
if [[ $create_user =~ ^(yes|y)$ ]]; then
    # Create new user
    echo "Enter desired login details below:\n"

    read -p "Username: " user
    read -p "Password: " pass

    useradd -m -G $(groups | cut -f 1 -d ' ' --complement | sed "s/ /,/g") ${user}
    passwd ${user}
    echo "User ${user} successfully created!\n"
    echo ""
    echo "You must manually add the user “${user}” to the sudoers file."

    # Delete default user
    read -p "Delete default user, “pi”? (this is strongly recommended!) [Y/n]\n" remove_default_user
    remove_default_user=${remove_default_user,,}
    if [[ $remove_default_user =~ ^(yes|y)$ ]]; then
        deluser --remove-all-files pi
        echo "Default user deleted."
    fi
fi

# @todo
# Set up MFA
# https://www.digitalocean.com/community/tutorials/how-to-protect-ssh-with-two-factor-authentication
# https://www.digitalocean.com/community/tutorials/how-to-set-up-multi-factor-authentication-for-ssh-on-ubuntu-14-04
