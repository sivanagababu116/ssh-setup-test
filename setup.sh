#!/bin/bash
set -e

USERNAME="userajay"
PUBKEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDKmH6o0vgZL1NZGJcLvMaAeVk07FuwNGml10RymGA3p client-to-server"

# Make sure user exists
if ! id "$USERNAME" >/dev/null 2>&1; then
  echo "User $USERNAME does not exist. Create it first."
  exit 1
fi

# Create .ssh directory with proper permissions
USER_HOME=$(eval echo "~$USERNAME")
mkdir -p "$USER_HOME/.ssh"
chmod 700 "$USER_HOME/.ssh"
chown "$USERNAME:$USERNAME" "$USER_HOME/.ssh"

# Write public key into authorized_keys
echo "$PUBKEY" > "$USER_HOME/.ssh/authorized_keys"
chmod 600 "$USER_HOME/.ssh/authorized_keys"
chown "$USERNAME:$USERNAME" "$USER_HOME/.ssh/authorized_keys"

# Restart SSH service
systemctl restart ssh

echo "SSH key for $USERNAME installed successfully."

