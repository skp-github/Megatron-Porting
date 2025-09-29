#!/bin/bash
PYTHON=python
SCRIPT=gpt_oss_trainer.py

NGPU=1

echo "Launching with $NGPU GPU(s)..."
$PYTHON -m torch.distributed.run --nproc_per_node="$NGPU" "$SCRIPT"