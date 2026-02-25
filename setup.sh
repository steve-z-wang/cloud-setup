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

bash "$SCRIPT_DIR/gpu_aliases.sh"

echo ""
echo "========================================="
echo " Base setup complete!"
echo "========================================="
echo ""
echo " Open a new shell for GPU aliases (t0, t1, ...)."
echo ""
