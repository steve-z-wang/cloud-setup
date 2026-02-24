#!/bin/bash
# Adds per-GPU tsp functions to ~/.bashrc
# Run once: bash scripts/gpu_aliases.sh

NUM_GPUS=$(nvidia-smi -L 2>/dev/null | wc -l)

if [ "$NUM_GPUS" -eq 0 ]; then
    echo "No GPUs found."
    exit 1
fi

# Remove old GPU aliases if present
sed -i '/# GPU tsp aliases/,/# END GPU tsp aliases/d' ~/.bashrc

# Write functions directly into bashrc
cat >> ~/.bashrc << 'GPUBLOCK'
# GPU tsp aliases
t0() { TS_SOCKET=/tmp/gpu0 tsp "$@"; }
t1() { TS_SOCKET=/tmp/gpu1 tsp "$@"; }
t2() { TS_SOCKET=/tmp/gpu2 tsp "$@"; }
t3() { TS_SOCKET=/tmp/gpu3 tsp "$@"; }
# END GPU tsp aliases
GPUBLOCK

echo "Added t0-t3 to ~/.bashrc ($NUM_GPUS GPUs found)."
echo "Open a new shell or run: source ~/.bashrc"
