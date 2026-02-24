#!/bin/bash
# Cloud GPU setup — run once on a fresh pod
#
# Usage:
#   git clone https://github.com/steve-z-wang/cloud-setup.git /tmp/cloud-setup
#   bash /tmp/cloud-setup/setup.sh
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)/scripts"

echo "========================================="
echo " Cloud GPU Setup"
echo "========================================="
echo ""

bash "$SCRIPT_DIR/system.sh"
bash "$SCRIPT_DIR/ssh.sh"
bash "$SCRIPT_DIR/git.sh"

echo ""
echo "========================================="
echo " Base setup complete!"
echo "========================================="
echo ""
echo " Clone a repo:  bash $SCRIPT_DIR/repo.sh git@github.com:user/repo.git"
echo " Install deps:  bash $SCRIPT_DIR/deps.sh /workspace/repo/requirements.txt"
echo ""
