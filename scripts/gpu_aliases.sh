#!/bin/bash
# Source this to get per-GPU tsp aliases
# Usage: source scripts/gpu_aliases.sh

NUM_GPUS=$(nvidia-smi -L 2>/dev/null | wc -l)

if [ "$NUM_GPUS" -eq 0 ]; then
    echo "No GPUs found."
    return 1 2>/dev/null || exit 1
fi

echo "Found $NUM_GPUS GPU(s):"
nvidia-smi -L

for i in $(seq 0 $((NUM_GPUS - 1))); do
    alias t$i="TS_SOCKET=/tmp/gpu$i tsp"
    TS_SOCKET=/tmp/gpu$i tsp -S 1
done

echo ""
echo "Aliases ready:"
for i in $(seq 0 $((NUM_GPUS - 1))); do
    echo "  t$i  — GPU $i queue"
done
echo ""
echo "Usage: t0 env CUDA_VISIBLE_DEVICES=0 python train.py ..."
echo "       t0           # check queue"
echo "       t0 -t ID     # tail output"
echo "       t0 -r ID     # remove queued job"
echo "       t0 -k ID     # kill running job"
