#!/bin/bash
# Install system packages and configure terminal
set -e
echo "  Installing apt packages (tmux, htop, nvtop, task-spooler)..."
apt-get update -qq && apt-get install -y -qq tmux htop nvtop task-spooler > /dev/null 2>&1
echo "  Setting TERM=xterm-256color..."
grep -q 'TERM=xterm-256color' ~/.bashrc 2>/dev/null || echo 'export TERM=xterm-256color' >> ~/.bashrc
echo "  Done."
