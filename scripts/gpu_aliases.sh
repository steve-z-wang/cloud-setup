#!/bin/bash
# Source this to get per-GPU tsp functions
# Usage: echo 'source /workspace/cloud-setup/scripts/gpu_aliases.sh' >> ~/.bashrc

NUM_GPUS=$(nvidia-smi -L 2>/dev/null | wc -l)

if [ "$NUM_GPUS" -gt 0 ]; then
    t0() { TS_SOCKET=/tmp/gpu0 tsp "$@"; }
    TS_SOCKET=/tmp/gpu0 tsp -S 1 2>/dev/null

    if [ "$NUM_GPUS" -gt 1 ]; then
        t1() { TS_SOCKET=/tmp/gpu1 tsp "$@"; }
        TS_SOCKET=/tmp/gpu1 tsp -S 1 2>/dev/null
    fi

    if [ "$NUM_GPUS" -gt 2 ]; then
        t2() { TS_SOCKET=/tmp/gpu2 tsp "$@"; }
        TS_SOCKET=/tmp/gpu2 tsp -S 1 2>/dev/null
    fi

    if [ "$NUM_GPUS" -gt 3 ]; then
        t3() { TS_SOCKET=/tmp/gpu3 tsp "$@"; }
        TS_SOCKET=/tmp/gpu3 tsp -S 1 2>/dev/null
    fi

    # Only print on interactive shells
    if [[ $- == *i* ]]; then
        echo "GPU queues: t0$([ $NUM_GPUS -gt 1 ] && echo ', t1')$([ $NUM_GPUS -gt 2 ] && echo ', t2')$([ $NUM_GPUS -gt 3 ] && echo ', t3') ($NUM_GPUS GPUs)"
    fi
fi
