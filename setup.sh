#!/bin/bash
# Cloud GPU setup — run once on a fresh pod
#
# Usage:
#   git clone https://github.com/steve-z-wang/cloud-setup.git /workspace/cloud-setup
#   bash /workspace/cloud-setup/setup.sh
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)/scripts"
SETUP_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "========================================="
echo " Cloud GPU Setup"
echo "========================================="
echo ""

bash "$SCRIPT_DIR/system.sh"
bash "$SCRIPT_DIR/ssh.sh"
bash "$SCRIPT_DIR/git.sh"

# Add GPU aliases to bashrc (idempotent)
if ! grep -q 'gpu_aliases.sh' ~/.bashrc 2>/dev/null; then
    echo "source $SCRIPT_DIR/gpu_aliases.sh" >> ~/.bashrc
    echo "[gpu] Added GPU aliases to ~/.bashrc"
fi

echo ""
echo "========================================="
echo " Base setup complete!"
echo "========================================="
echo ""
echo " Clone a repo:  bash $SCRIPT_DIR/repo.sh git@github.com:user/repo.git"
echo " Install deps:  bash $SCRIPT_DIR/deps.sh /workspace/repo/requirements.txt"
echo ""
echo " GPU aliases (t0, t1, ...) available in new shells."
echo ""
