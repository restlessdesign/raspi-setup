#!/bin/bash

# Ensure program is run via sudo
if [ "$(whoami)" != "root" ]; then
    echo "This script must be run as the root user"
    exit 1
fi

echo ""
echo "#============================="
echo "# MULTI-FACTOR AUTH SETUP"
echo "#============================="
echo ""

# Run through Google Authenticator setup
google-authenticator

# Add Google Authenticator to SSH config
cat >> /etc/pam.d/sshd <<EOF
# Google MFA
auth required pam_google_authenticator.so
EOF

sed -i "s/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g" /etc/ssh/sshd_config

# Restart SSH service
/etc/init.d/ssh restart

echo "Multi-factor authentication setup complete!"
