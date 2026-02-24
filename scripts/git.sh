#!/bin/bash
# Configure git
set -e
echo "[git] Configuring..."
git config --global user.name "Steve Wang"
git config --global user.email "stevewang.at.work@gmail.com"
git config --global init.defaultBranch main
git config --global pull.rebase false
echo "[git] Done."
