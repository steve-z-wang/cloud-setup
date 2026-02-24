#!/bin/bash
# Adds per-GPU tsp functions to ~/.bashrc
# Run once: bash scripts/gpu_aliases.sh
#
# t0 python train.py  → queues on GPU 0
# t1 python train.py  → queues on GPU 1
# t0                   → list GPU 0 queue
# t0 -t ID            → tail output
# t0 -k ID            → kill job
# t0 -r ID            → remove job

NUM_GPUS=$(nvidia-smi -L 2>/dev/null | wc -l)

if [ "$NUM_GPUS" -eq 0 ]; then
    echo "No GPUs found."
    exit 1
fi

# Remove old GPU aliases if present
sed -i '/# GPU tsp aliases/,/# END GPU tsp aliases/d' ~/.bashrc

# If first arg starts with '-' or no args, pass directly to tsp (management command).
# Otherwise, prepend env CUDA_VISIBLE_DEVICES=N (queue a job).
cat >> ~/.bashrc << 'GPUBLOCK'
# GPU tsp aliases
_tgpu() {
    local gpu=$1; shift
    if [ $# -eq 0 ] || [[ "$1" == -* ]]; then
        TS_SOCKET=/tmp/gpu$gpu tsp "$@"
    else
        TS_SOCKET=/tmp/gpu$gpu tsp env CUDA_VISIBLE_DEVICES=$gpu "$@"
    fi
}
t0() { _tgpu 0 "$@"; }
t1() { _tgpu 1 "$@"; }
t2() { _tgpu 2 "$@"; }
t3() { _tgpu 3 "$@"; }
# END GPU tsp aliases
GPUBLOCK

echo "Added t0-t3 to ~/.bashrc ($NUM_GPUS GPUs found)."
echo "Open a new shell or run: source ~/.bashrc"
