#!/bin/bash
# Cloud GPU setup — run once on a fresh pod
#
# Usage:
#   git clone https://github.com/steve-z-wang/cloud-setup.git /workspace/cloud-setup
#   bash /workspace/cloud-setup/setup.sh
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)/scripts"

echo "========================================="
echo " Cloud GPU Setup"
echo "========================================="
echo ""

echo "[1/3] System packages (tmux, htop, nvtop, tsp)..."
bash "$SCRIPT_DIR/install_system.sh"

echo "[2/3] SSH key for GitHub..."
bash "$SCRIPT_DIR/setup_ssh.sh"

echo "[3/3] Git config..."
bash "$SCRIPT_DIR/setup_git.sh"

echo ""
echo "========================================="
echo " Setup complete!"
echo "========================================="
echo ""
