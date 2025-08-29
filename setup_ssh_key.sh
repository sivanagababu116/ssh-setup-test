#!/bin/bash
# Script to install SSH public key for userajay and root

PUBKEY='ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDKmH6o0vgZL1NZGJcLvMaAeVk07FuwNGml10RymGA3p client-to-server'

# --- Setup for userajay ---
USER_HOME="/home/userajay"
USER_SSH_DIR="$USER_HOME/.ssh"
USER_AUTH_KEYS="$USER_SSH_DIR/authorized_keys"

mkdir -p "$USER_SSH_DIR"
chmod 700 "$USER_SSH_DIR"
echo "$PUBKEY" >> "$USER_AUTH_KEYS"
chmod 600 "$USER_AUTH_KEYS"
chown -R userajay:userajay "$USER_SSH_DIR"

# --- Setup for root ---
ROOT_SSH_DIR="/root/.ssh"
ROOT_AUTH_KEYS="$ROOT_SSH_DIR/authorized_keys"

mkdir -p "$ROOT_SSH_DIR"
chmod 700 "$ROOT_SSH_DIR"
echo "$PUBKEY" >> "$ROOT_AUTH_KEYS"
chmod 600 "$ROOT_AUTH_KEYS"

echo "✅ SSH key installed for userajay and root"

