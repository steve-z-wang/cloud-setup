#!/bin/bash
# Install system packages
set -e
echo "[system] Installing packages..."
apt-get update -qq && apt-get install -y -qq tmux htop nvtop task-spooler > /dev/null 2>&1
grep -q 'TERM=xterm-256color' ~/.bashrc 2>/dev/null || echo 'export TERM=xterm-256color' >> ~/.bashrc
echo "[system] Done."
