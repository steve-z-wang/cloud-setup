#!/bin/bash
# Setup SSH key for GitHub (persists on /workspace volume)
set -e

SSH_DIR="/workspace/.ssh"
KEY_FILE="$SSH_DIR/id_ed25519"

if [ ! -f "$KEY_FILE" ]; then
    echo "  Generating new SSH key..."
    mkdir -p "$SSH_DIR"
    ssh-keygen -t ed25519 -f "$KEY_FILE" -N "" -C "cloud-gpu" -q
else
    echo "  Existing SSH key found on volume."
fi

echo "  Copying key to ~/.ssh..."
mkdir -p ~/.ssh
cp "$KEY_FILE" ~/.ssh/id_ed25519
cp "$KEY_FILE.pub" ~/.ssh/id_ed25519.pub
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub
ssh-keyscan github.com >> ~/.ssh/known_hosts 2>/dev/null

echo ""
echo "  Add this key to GitHub → Settings → SSH Keys:"
echo ""
cat ~/.ssh/id_ed25519.pub
echo ""
read -p "  Press Enter after adding the key..."

echo "  Verifying GitHub access..."
if ssh -T git@github.com 2>&1 | grep -q "successfully authenticated"; then
    echo "  GitHub access verified."
else
    echo "  Warning: GitHub auth may have failed."
fi
