#!/bin/bash
# Install Python dependencies from a requirements.txt
set -e

REQ_FILE="${1:?Usage: bash deps.sh <requirements.txt>}"
echo "[deps] Installing from $REQ_FILE..."
pip install --upgrade pip -q
pip install -r "$REQ_FILE" -q
echo "[deps] Done."
python -c "import torch; print(f'[deps] PyTorch {torch.__version__}, CUDA: {torch.cuda.is_available()}')" 2>/dev/null || true
