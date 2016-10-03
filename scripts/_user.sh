#!/bin/bash

# Ensure program is run via sudo
if [ "$(whoami)" != "root" ]; then
    echo "This script must be run as the root user"
    exit 1
fi

echo ""
echo "#============================="
echo "# USER SETUP"
echo "#============================="
echo ""

read -p "Create new user? [Y/n] " create_user
create_user=${create_user,,}
if [[ $create_user =~ ^(yes|y)$ ]]; then
    # Create new user
    read -p "Username: " user

    useradd -m -G $(groups | cut -f 1 -d ' ' --complement | sed "s/ /,/g") ${user}
    passwd ${user}
    echo "User ${user} successfully created!"
    echo ""
    echo "You must manually add the user “${user}” to the sudoers file. Copy the following line:"
    echo ""
    echo "${user}    ALL=(ALL) ALL"
    echo ""
    read -p "Once you have copied the line above, press [Enter] to continue…"

    echo "visudo will now execute. Paste the text below the line which looks like:"
    echo ""
    echo "root    ALL=(ALL) ALL"
    echo ""
    echo "When you are done, exit the editor to continue running this script."
    echo ""
    read -p "Press [Enter] to continue…"
    visudo
    echo ""

    # Copy dotfiles
    echo "Copying .bash_aliases file…"
    cp /home/pi/.bash_aliases /home/${user}/.bash_aliases

    # Delete default user
    read -p "Delete default user, “pi”? (this is strongly recommended!) [Y/n] " remove_default_user
    remove_default_user=${remove_default_user,,}
    if [[ $remove_default_user =~ ^(yes|y)$ ]]; then
        deluser --remove-all-files pi
        echo "Default user deleted."
    fi
fi

echo "User setup complete!"
