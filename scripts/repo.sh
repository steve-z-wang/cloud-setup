#!/bin/bash
# Clone a repo to /workspace
set -e

REPO_URL="${1:?Usage: bash repo.sh <git-url> [dir-name]}"
DIR_NAME="${2:-$(basename "$REPO_URL" .git)}"
PROJECT_DIR="/workspace/$DIR_NAME"

if [ -d "$PROJECT_DIR/.git" ]; then
    echo "[repo] Repo exists, pulling latest..."
    cd "$PROJECT_DIR" && git pull
else
    echo "[repo] Cloning $REPO_URL..."
    git clone "$REPO_URL" "$PROJECT_DIR"
fi
echo "[repo] Done. Project at $PROJECT_DIR"
