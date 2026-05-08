#!/bin/bash
# Install Claude Code CLI.
# Uses Anthropic's official installer at https://claude.ai/install.sh
# (handles Node.js dependency automatically).
set -e

echo "  Installing Claude Code..."
curl -fsSL https://claude.ai/install.sh | bash
echo "  Done. Run 'claude' in an interactive shell to log in."
