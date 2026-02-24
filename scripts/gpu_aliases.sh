#!/bin/bash
# Adds per-GPU tsp functions to ~/.bashrc
# Run once: bash scripts/gpu_aliases.sh
#
# t0 python train.py  → runs on GPU 0
# t1 python train.py  → runs on GPU 1
# t0                   → check GPU 0 queue
# t0 -t ID            → tail output

NUM_GPUS=$(nvidia-smi -L 2>/dev/null | wc -l)

if [ "$NUM_GPUS" -eq 0 ]; then
    echo "No GPUs found."
    exit 1
fi

# Remove old GPU aliases if present
sed -i '/# GPU tsp aliases/,/# END GPU tsp aliases/d' ~/.bashrc

# Write functions directly into bashrc
# env CUDA_VISIBLE_DEVICES=N is baked in so jobs auto-use the right GPU
cat >> ~/.bashrc << 'GPUBLOCK'
# GPU tsp aliases
t0() { TS_SOCKET=/tmp/gpu0 tsp env CUDA_VISIBLE_DEVICES=0 "$@"; }
t1() { TS_SOCKET=/tmp/gpu1 tsp env CUDA_VISIBLE_DEVICES=1 "$@"; }
t2() { TS_SOCKET=/tmp/gpu2 tsp env CUDA_VISIBLE_DEVICES=2 "$@"; }
t3() { TS_SOCKET=/tmp/gpu3 tsp env CUDA_VISIBLE_DEVICES=3 "$@"; }
# END GPU tsp aliases
GPUBLOCK

echo "Added t0-t3 to ~/.bashrc ($NUM_GPUS GPUs found)."
echo "Open a new shell or run: source ~/.bashrc"
