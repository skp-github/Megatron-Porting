#!/bin/bash

# Default values
NGPU=1
TP=1
PP=1
EP=1

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --ngpu) NGPU="$2"; shift 2 ;;
        --tp) TP="$2"; shift 2 ;;
        --pp) PP="$2"; shift 2 ;;
        --ep) EP="$2"; shift 2 ;;
        *) echo "Unknown option: $1"; exit 1 ;;
    esac
done

# Validate TP * PP * EP = NGPU
TOTAL=$((TP * PP * EP))
if [ $TOTAL -ne $NGPU ]; then
    echo "Error: TP($TP) * PP($PP) * EP($EP) = $TOTAL, but NGPU = $NGPU"
    exit 1
fi

echo "Launching with $NGPU GPU(s), TP=$TP, PP=$PP, EP=$EP"

python -m torch.distributed.run \
    --nproc_per_node="$NGPU" \
    gpt_oss_mock_data_trainer.py \
    --tp "$TP" \
    --pp "$PP" \
    --ep "$EP"